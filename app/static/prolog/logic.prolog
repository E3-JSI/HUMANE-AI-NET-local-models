% =================== Helper functions ===================


% A student has learned a section if they have learned all concepts in that section
hasLearnedSection(Section) :-
    section(Section),
    not((
        teachesConcept(Section, Concept),
        not(hasLearnedConcept(Concept))
    )).

% A student can learn a section if they have learned all dependent sections
canLearnSection(Section) :-
    section(Section),
    (
        % Check if the section has a 'none' prerequisite directly
        hasSectionPrerequisite(Section, none)
        ;
        % Check if all prerequisites are met
        not((
            hasSectionPrerequisite(Section, PrerequisiteSection),
            PrerequisiteSection \= none,
            not(hasLearnedSection(PrerequisiteSection))
        ))
    ).

% A student can learn a concept if they can learn the section that teaches it, and if they have learned all prerequisites
canLearnConcept(Concept) :-
    teachesConcept(Section, Concept),
    canLearnSection(Section),
    not(hasLearnedConcept(Concept)),
    not((
        hasPrerequisite(Concept, PrerequisiteConcept),
        not(hasLearnedConcept(PrerequisiteConcept))
    )).

% A next step should be a learnable concept that will bring the student closer to their goal
% If the goal is a section, the student needs to learn all prerequisite sections, and then all of the concepts in the section itself
% If the goal is a concept, the student needs to learn all prerequisite sections, and then learn the prerequisite concepts in the section
% Determine if all direct prerequisites of a concept have been learned by the student

% Recursively find all prerequisites leading up to a concept.
prerequisitePath(GoalConcept, Concept) :-
    hasPrerequisite(GoalConcept, Concept).
prerequisitePath(GoalConcept, Concept) :-
    hasPrerequisite(GoalConcept, Intermediate),
    prerequisitePath(Intermediate, Concept).

% Check if all prerequisites for a concept have been learned by the student.
allPrerequisitesLearned(Concept) :-
    not((hasPrerequisite(Concept, Prerequisite),
         not(hasLearnedConcept(Prerequisite)))).

prerequisitesMet(GoalConcept, Concept) :-
    prerequisitePath(GoalConcept, Concept),
    not(hasLearnedConcept(Concept)),
    allPrerequisitesLearned(Concept).

% Identifies the next learnable concept for the student based on the direct and indirect prerequisites
% required for reaching the goal concept, ensuring uniqueness in suggestions.
nextStep(NextConcept) :-
    hasGoal(GoalConcept),
    setof(Concept, prerequisitesMet(GoalConcept, Concept), UniqueConcepts),
    member(NextConcept, UniqueConcepts).

% Optionally, consider the prerequisites of the section if the goal concept's prerequisites are satisfied
nextStep(NextSection) :-
    hasGoal(GoalConcept),
    teachesConcept(Section, GoalConcept),
    setof(SectionConcept,
          sectionPrerequisitesMet(Section, GoalConcept, SectionConcept),
          UniqueSections),
    member(NextSection, UniqueSections).

sectionPrerequisitesMet(Section, GoalConcept, PrerequisiteSection) :-
    hasSectionPrerequisite(Section, PrerequisiteSection),
    PrerequisiteSection \= none,
    not(hasLearnedSection(PrerequisiteSection)),
    teachesConcept(PrerequisiteSection, NecessaryConcept),
    prerequisitePath(GoalConcept, NecessaryConcept),
    not(hasLearnedConcept(NecessaryConcept)),
    PrerequisiteSection = Section.

% =================== Example data ===================

% hasGoal(loss_function_optimization).
% hasLearnedConcept(computer_programs_and_business_logic).
% hasLearnedConcept(limitations_of_traditional_programs).
% hasLearnedConcept(introduction_to_machine_learning).
% hasLearnedConcept(distinction_from_traditional_programming).
% hasLearnedConcept(definition_of_machine_learning).
% hasLearnedConcept(applications_of_machine_learning).
% hasLearnedConcept(calculus_basics).