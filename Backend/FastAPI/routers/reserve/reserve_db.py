from fastapi import APIRouter, HTTPException, status
from sqlalchemy.orm import Session
from db.mod import Reserve
from db.schem import reserve_schema, reserves_schema
from db.database import get_database_session
from .queries import GET_RESERVE_BY_PRODUCT, GET_RESERVE_BY_USER

router = APIRouter(
    prefix="/reserve",
    tags=["reserve"],
    responses={404: {"message": "No encontrado"}},
)

@router.get("/byProductId/{product_id}")
def get_reserve_by_product(product_id: int):
    return search_reserve_by_product(product_id)

@router.get("/byUserId/{user_id}")
async def get_reserve_by_user(user_id: int):
    return search_reserve_by_user(user_id)

def search_reserve_by_user(key, include_product_title=False, include_reserve_id=False):
    with get_database_session() as session:
        results = session.execute(GET_RESERVE_BY_USER, (key,)).fetchall()
        reserve_by_user = reserves_schema(results)

        for reserve in reserve_by_user:
            format_start_time(reserve)

            if include_product_title:
                reserve["productName"] = reserve["title"]
            if include_reserve_id:
                reserve["idReserve"] = reserve["reserve"]

        return reserve_by_user

def search_reserve_by_product(key):
    with get_database_session() as session:
        results = session.execute(GET_RESERVE_BY_PRODUCT, (key,)).fetchall()
        reserve_by_product = reserves_schema(results)

        for reserve in reserve_by_product:
            format_start_time(reserve)

        return reserve_by_product

def format_start_time(reserve):
    start_time = reserve.get('start_time')
    if start_time is not None:
        start_time_str = str(start_time)
        if ':' in start_time_str:
            hour, minute, second = start_time_str.split(':')
            reserve['start_time'] = {
                'hour': int(hour),
                'minute': int(minute),
                'second': int(second),
                'nano': 0
            }
        else:
            # Log or raise an exception for invalid start_time_str
            raise HTTPException(status_code=500, detail=f"Invalid start_time_str: {start_time_str}")

