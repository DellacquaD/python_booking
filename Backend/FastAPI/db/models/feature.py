from pydantic import BaseModel


class Feature(BaseModel):
    feature_id: int
    name: str