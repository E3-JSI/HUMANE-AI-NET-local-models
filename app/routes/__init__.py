from fastapi import APIRouter
from app.routes.v1 import api_router as v1

api_router = APIRouter()
api_router.include_router(v1, prefix="/v1")
