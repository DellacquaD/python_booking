from pydantic import BaseModel


class State(BaseModel):
    state_id: int
    name: str
    country_id: int