from pydantic import BaseModel

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