from pydantic import BaseModel


class Country(BaseModel):
    country_id: int
    name: str