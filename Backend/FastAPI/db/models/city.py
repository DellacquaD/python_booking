from pydantic import BaseModel


class City(BaseModel):
    city_id: int
    name: str
    state_id: int