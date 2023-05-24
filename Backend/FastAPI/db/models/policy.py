from pydantic import BaseModel


class Policy(BaseModel):
    cancellation: str
    rules: str
    security: str