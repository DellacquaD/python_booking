from pydantic import BaseModel


class Image(BaseModel):
    imageUrl: str
    title: str