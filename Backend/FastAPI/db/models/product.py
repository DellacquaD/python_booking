from pydantic import BaseModel
from .policy import Policy
from .address import Address
from .image import Image

class Product(BaseModel):
    title: str
    address: Address
    description: str
    stars: int
    scoring: int
    review: str
    category: int
    features: list
    policy: Policy
    images: list[Image]