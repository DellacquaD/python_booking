from pydantic import BaseModel


class Address(BaseModel):
    number: str
    street: str
    city: int