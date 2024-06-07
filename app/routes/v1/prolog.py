import janus_swi as janus

from typing import Any
from fastapi import APIRouter, status
from fastapi.responses import JSONResponse
from pydantic import BaseModel

from app.library.prolog import get_next_step

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
    # domain="d2l" not supported right now
    if data.domain != "d2l":
        return JSONResponse({
            "error": "Domain not supported."
        }, status_code=status.HTTP_400_BAD_REQUEST)

    next_steps = get_next_step(data.domain, data.goals, data.learned)

    return JSONResponse({
        "next_steps": next_steps
    })
