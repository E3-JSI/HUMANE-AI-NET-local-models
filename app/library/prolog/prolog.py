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
    if len(goals) == 0:
        print("No goals provided.")
        return []
        
    janus.consult("goals", "\n".join([f"hasGoal({goal})." for goal in preprocess_terms(goals)]))

    # add learned
    if len(learned) != 0:
        print(learned)
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


def reverse_mapping(d: dict[str, List[str]]) -> dict:
    new_dict = {}
    for k, v in d.items():
        for item in v:
            if item in new_dict:
                new_dict[item].append(k)
            else:
                new_dict[item] = [k]

    return new_dict


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


def concept_to_wiki(domain: str, terms: List[str]):
    """
    Maps Prolog concepts to Wikipedia concepts
    """
    mapping = get_wikipedia_mapping(domain)

    concepts = []
    for term in terms:
        if term in mapping:
            concepts.extend(mapping[term])

    return list(set(concepts))


def wiki_to_concept(domain: str, terms: List[str]):
    """
    Maps Wikipedia concepts to Prolog concepts
    """
    mapping = get_wikipedia_mapping(domain)
    reverse_map = reverse_mapping(mapping)

    concepts = []
    for term in terms:
        if term in reverse_map:
            concepts.extend(reverse_map[term])

    return list(set(concepts))

