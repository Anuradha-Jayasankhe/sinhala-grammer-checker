from fastapi import APIRouter, Form, Depends

from auth.authorize import oauth2_scheme, get_current_user, credentials_exception
from services.es_service import query_knowledge_base


router = APIRouter(
    prefix="/api/esystem",
    tags=["esystem"],
    responses={404: {"description": "The requested page was not found"}},
)


@router.post("/")
async def check(
    query: str = Form(...),
):
    print(query)
    return query_knowledge_base(query)
