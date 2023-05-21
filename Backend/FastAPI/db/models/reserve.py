from pydantic import BaseModel


class Reserve(BaseModel):
    reserve_id: int
    check_in: str
    check_out: str
    start_time: str
    product_id: int
    user_id: int