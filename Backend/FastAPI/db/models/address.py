from pydantic import BaseModel


class Address(BaseModel):
    address_id: int
    number: str
    street: str
    city_id: int