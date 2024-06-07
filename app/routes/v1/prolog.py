import janus_swi as janus
from typing import Any, List
from fastapi import APIRouter, status
from fastapi.responses import JSONResponse
from pydantic import BaseModel

from app.library.prolog import *

router = APIRouter()

# ================================================
# Class definitions
# ================================================


class NextStepInput(BaseModel):
    domain: str
    goals: list[str]
    learned: list[str]


# ================================================
# Route definitions
# ================================================


@router.get(
    "/test",
    status_code=status.HTTP_200_OK,
    description="Make sure Prolog is working.",
)
async def test() -> JSONResponse:
    res = janus.query_once("Y is X+1", {"X": 1})

    return JSONResponse(res)


@router.post(
    "/next_step",
    status_code=status.HTTP_200_OK,
    description="Get the next step.",
)
async def api_next_step(data: NextStepInput) -> Any:
    goals = wiki_to_concept(data.domain, data.goals)
    learned = wiki_to_concept(data.domain, data.learned)

    next_steps = get_next_step(data.domain, goals, learned)
    next_steps = concept_to_wiki(data.domain, next_steps)

    return JSONResponse({
        "next_steps": next_steps
    })

