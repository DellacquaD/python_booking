from pydantic import BaseModel
from typing import List, Optional
import json

class UserIn(BaseModel):
    email: str
    first_name: str
    last_name: str
    password: str
    role: str
    username: str

class UserOut(BaseModel):
    user_id: int
    email: str
    first_name: str
    last_name: str
    role: str
    username: str


class UserDBSchema(BaseModel):
    username: str
    first_name: str
    last_name: str
    email: str

    class Config:
        orm_mode = True

class AddressSchema(BaseModel):
    number: Optional[str]
    street: Optional[str]
    city: Optional[int]

class ImageSchema(BaseModel):
    imageUrl: Optional[str]
    title: Optional[str]

class PolicySchema(BaseModel):
    rules: str
    security: str
    cancellation: str
    
class ProductSchema(BaseModel):
    id: Optional[int]
    title: Optional[str]
    address: Optional[AddressSchema]
    description: Optional[str]
    stars: Optional[int]
    scoring: Optional[int]
    review: Optional[str]
    category: Optional[int]
    features: Optional[List[int]]
    images: Optional[list[ImageSchema]]
    policy: Optional[PolicySchema]
    reserve: Optional[List]

    class Config:
        orm_mode = True

class Reserve(BaseModel):
    pass

    class Config:
        orm_mode = True

def product_schema(product: ProductSchema, include_policy: bool = False, include_reserve: bool = False) -> dict:
    result = {
        "id": product.id,
        "title": product.title,
        "address": json.loads(product.address) if isinstance(product.address, str) else product.address,
        "description": product.description,
        "stars": product.stars,
        "scoring": product.scoring,
        "review": product.review,
        "category": product.category,
        "features": json.loads(product.features) if isinstance(product.features, str) else product.features,
        "images": json.loads(product.images) if isinstance(product.images, str) else product.images,
    }
    if include_policy:
        result["policy"] = product.policy
    if include_reserve:
        result["reserve"] = product.reserve
    return result


def products_schema(products: List[ProductSchema], include_policy: bool = False, include_reserve: bool = False) -> list:
    return [product_schema(product, include_policy=include_policy, include_reserve=include_reserve) for product in products]

def reserve_schema(reserve: Reserve) -> dict:
    return {
        "id": reserve.id,
        "start_time": reserve.start_time,
        "end_time": reserve.end_time,
        "user": reserve.user,
        "product": reserve.product
    }

def reserves_schema(products: List[ProductSchema], include_policy: bool = False, include_reserve: bool = False) -> list:
    return [reserve_schema(product, include_policy=include_policy, include_reserve=include_reserve) for product in products]