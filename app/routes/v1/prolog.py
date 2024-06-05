import janus_swi as janus

from typing import Any
from fastapi import APIRouter, status
from fastapi.responses import JSONResponse
router = APIRouter()

# ================================================
# Route definitions
# ================================================


@router.get(
    "/test",
    status_code=status.HTTP_200_OK,
    description="Test Prolog",
)
async def test() -> JSONResponse:
    res = janus.query_once("Y is X+1", {"X": 1})

    return JSONResponse(res)
