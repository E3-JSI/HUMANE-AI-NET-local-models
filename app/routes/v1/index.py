from typing import Any

from fastapi import APIRouter, status

router = APIRouter()

# ================================================
# Route definitions
# ================================================


@router.get(
    "/",
    status_code=status.HTTP_200_OK,
    description="Homepage",
)
async def homepage() -> Any:
    return {"output": "Hello World!"}
