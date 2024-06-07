import json
from typing import List
import janus_swi as janus

from app.library.llm.chains import wiki_concept_mapping
from app.static import STATIC_PATH


def load_concepts(name: str):
    path = STATIC_PATH / "prolog" / f"{name}_concepts.prolog"

    janus.consult(str(path))


def load_logic():
    path = STATIC_PATH / "prolog" / "logic.prolog"
    janus.consult(str(path))


def preprocess_terms(terms: List[str]) -> List[str]:
    # if there are any terms that have spaces, surround them with single quotes
    for i, term in enumerate(terms):
        if " " in term and not (len(term) > 1 and term[0] + term[-1] == "''"):
            terms[i] = f"'{term}'"

    return terms


def get_next_step(domain: str, goals: List[str], learned: List[str]) -> List[str]:
    load_concepts(domain)
    load_logic()

    # add goals
    if len(goals) != 0:
        janus.consult("goals", "\n".join([f"hasGoal({goal})." for goal in preprocess_terms(goals)]))

    # add learned
    if len(learned) != 0:
        janus.consult("learned", "\n".join([f"hasLearnedConcept({learned})." for learned in preprocess_terms(learned)]))

    # get next step
    next_step = janus.query("nextStep(X).")

    next_steps = []
    for step in next_step:
        next_steps.append(step["X"])

    return next_steps


def get_concepts(domain: str) -> List[str]:
    load_concepts(domain)

    concepts = janus.query("isConcept(X).")

    concepts_list = []
    for concept in concepts:
        concepts_list.append(concept["X"])

    concepts = janus.query("isPartOf(X, _) ; isPrerequisiteOf(X, _) ; isPrerequisiteOf(_, X).")
    for concept in concepts:
        concepts_list.append(concept["X"])

    concepts_list = list(set(concepts_list))
    concepts_list = preprocess_terms(concepts_list)

    return concepts_list


def get_wikipedia_concepts(domain: str):
    """
    Loads from static/wikipedia_{domain}.json
    """
    with open(STATIC_PATH / 'wikipedia' / f"wikipedia_{domain}.json", "r") as f:
        return json.load(f)


def get_wikipedia_mapping(domain: str):
    mapping_path = STATIC_PATH / "wikipedia" / f"{domain}_mapping.json"

    # check if mapping exists
    if mapping_path.exists():
        with open(mapping_path, "r") as f:
            return json.load(f)

    concepts = get_concepts(domain)
    wiki_concepts = get_wikipedia_concepts(domain)

    chain = wiki_concept_mapping()
    inputs = [{'domain': domain, 'concept': concept, 'wiki_concepts': json.dumps(wiki_concepts)} for concept in concepts]

    results = chain.batch(inputs)
    concept_map = {concept: result['wikipedia_concepts'] for concept, result in zip(concepts, results)}

    # save mapping
    with open(mapping_path, "w") as f:
        json.dump(concept_map, f)

    return concept_map
