% =================== Helper functions ===================

hasLearnedConcept(none).

% A student has learned a section if they have learned all concepts in that section
hasLearnedSection(Section) :-
    isSection(Section),
    not((
        isPartOf(Concept, Section),
        not(hasLearnedConcept(Concept))
    )).

% A student can learn a section if they have learned all dependent sections
canLearnSection(Section) :-
    isSection(Section),
    (
        % Check if the section has a 'none' prerequisite directly
        isSectionPrerequisiteOf(none, Section)
        ;
        % Check if all prerequisites are met
        not((
            isSectionPrerequisiteOf(PrerequisiteSection, Section),
            PrerequisiteSection \= none,
            not(hasLearnedSection(PrerequisiteSection))
        ))
    ).

% A student can learn a concept if they can learn the section that teaches it, and if they have learned all prerequisites
canLearnConcept(Concept) :-
    isPartOf(Concept, Section),
    canLearnSection(Section),
    not(hasLearnedConcept(Concept)),
    not((
        isPrerequisiteOf(PrerequisiteConcept, Concept),
        not(hasLearnedConcept(PrerequisiteConcept))
    )).

% A next step should be a learnable concept that will bring the student closer to their goal
% If the goal is a section, the student needs to learn all prerequisite sections, and then all of the concepts in the section itself
% If the goal is a concept, the student needs to learn all prerequisite sections, and then learn the prerequisite concepts in the section
% Determine if all direct prerequisites of a concept have been learned by the student

% Recursively find all prerequisites leading up to a concept.
prerequisitePath(GoalConcept, Concept) :-
    isPrerequisiteOf(Concept, GoalConcept).
prerequisitePath(GoalConcept, Concept) :-
    isPrerequisiteOf(Intermediate, GoalConcept),
    prerequisitePath(Intermediate, Concept).

% Check if all prerequisites for a concept have been learned by the student.
allPrerequisitesLearned(Concept) :-
    not((isPrerequisiteOf(Prerequisite, Concept),
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
    isPartOf(GoalConcept, Section),
    setof(SectionConcept,
          sectionPrerequisitesMet(Section, GoalConcept, SectionConcept),
          UniqueSections),
    member(NextSection, UniqueSections).

sectionPrerequisitesMet(Section, GoalConcept, PrerequisiteSection) :-
    isSectionPrerequisiteOf(PrerequisiteSection, Section),
    PrerequisiteSection \= none,
    not(hasLearnedSection(PrerequisiteSection)),
    isPartOf(NecessaryConcept, PrerequisiteSection),
    prerequisitePath(GoalConcept, NecessaryConcept),
    not(hasLearnedConcept(NecessaryConcept)),
    PrerequisiteSection = Section.

% =================== Example data ===================

% hasGoal(loss_function_optimization).
% hasLearnedConcept(computer_programs_and_business_logic).
% hasLearnedConcept(limitations_of_traditional_programs).
% hasLearnedConcept(introduction_to_machine_learning).
% hasLearnedConcept().
% hasLearnedConcept().
% hasLearnedConcept().
% hasLearnedConcept().

