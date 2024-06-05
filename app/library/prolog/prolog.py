from typing import List
import janus_swi as janus

from app.static import STATIC_PATH


def load_concepts(name: str):
    path = STATIC_PATH / "prolog" / f"{name}_concepts.prolog"

    janus.consult(str(path))


def load_logic():
    path = STATIC_PATH / "prolog" / "logic.prolog"
    janus.consult(str(path))


def get_next_step(domain: str, goals: List[str], learned: List[str]):
    load_concepts(domain)
    load_logic()

    # add goals
    if len(goals) != 0:
        janus.consult("goals", "\n".join([f"hasGoal({goal})." for goal in goals]))

    # add learned
    if len(learned) != 0:
        janus.consult("learned", "\n".join([f"hasLearnedConcept({learned})." for learned in learned]))

    # get next step
    next_step = janus.query("nextStep(X).")

    return next_step

