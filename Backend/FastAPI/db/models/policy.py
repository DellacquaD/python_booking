from pydantic import BaseModel


class Policy(BaseModel):
    policy_id: int
    cancellation: str
    rules: str
    security: str