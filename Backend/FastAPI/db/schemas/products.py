from pydantic import BaseModel
from typing import List, Optional
import json

class AddressSchema(BaseModel):
    number: Optional[str]
    street: Optional[str]
    city: Optional[int]

class ImageSchema(BaseModel):
    imageUrl: Optional[str]
    title: Optional[str]

class ProductSchema(BaseModel):
    id: int
    title: str
    address: Optional[AddressSchema]
    description: Optional[str]
    stars: Optional[int]
    scoring: Optional[int]
    review: Optional[str]
    category: Optional[int]
    features: Optional[List[int]]
    images: Optional[List[ImageSchema]]
    policy: Optional[List]
    reserve: Optional[List]

class ProductPolicySchema(BaseModel):
    rules: Optional[str]
    security: Optional[str]
    cancellation: Optional[str]

class ProductCreateSchema(BaseModel):
    description: Optional[str]
    review: Optional[str]
    scoring: Optional[int]
    stars: Optional[int]
    title: Optional[str]
    address: Optional[AddressSchema]
    category: Optional[int]
    policy: Optional[ProductPolicySchema]
    features: Optional[List[int]]
    images: Optional[List[ImageSchema]]

class ProductUpdateSchema(BaseModel):
    description: Optional[str]
    review: Optional[str]
    scoring: Optional[int]
    stars: Optional[int]
    title: Optional[str]
    category: Optional[int]
    features: Optional[List[int]]

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
        "images": [image.dict() for image in product.images] if isinstance(product.images, list) and all(isinstance(image, ImageSchema) for image in product.images) else [],
    }
    if include_policy:
        result["policy"] = product.policy
    if include_reserve:
        result["reserve"] = product.reserve
    return result


def products_schema(products: List[ProductSchema], include_policy: bool = False, include_reserve: bool = False) -> list:
    return [product_schema(product, include_policy=include_policy, include_reserve=include_reserve) for product in products]
