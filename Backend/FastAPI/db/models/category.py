from pydantic import BaseModel


class Category(BaseModel):
    category_id: int
    description: str
    image_url: str
    quantity: int
    title: str