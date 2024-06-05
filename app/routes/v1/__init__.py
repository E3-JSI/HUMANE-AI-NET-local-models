from fastapi import APIRouter

from app.routes.v1 import index
from app.routes.v1 import prolog

api_router = APIRouter()
api_router.include_router(index.router, prefix="", tags=["home"])
api_router.include_router(prolog.router, prefix="/prolog", tags=["prolog"])
