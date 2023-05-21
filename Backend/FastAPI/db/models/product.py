from pydantic import BaseModel


class Product(BaseModel):
    product_id: int
    description: str
    review: str
    scoring: int
    stars: int
    title: str
    address: object
    images: list
    features: list
    category_id: int
    policy_id: int