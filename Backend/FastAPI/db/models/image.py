from pydantic import BaseModel


class Image(BaseModel):
    image_id: int
    image_url: str
    title: str
    product_id: int