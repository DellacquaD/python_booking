from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from pydantic import BaseModel
from .base import Base

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

def user_from_sqlalchemy(user: User) -> UserOut:
    return UserOut(
        user_id=user.user_id,
        email=user.email,
        first_name=user.first_name,
        last_name=user.last_name,
        role=user.role,
        username=user.username
    )

def user_to_sqlalchemy(user_in: UserIn) -> User:
    return User(
        email=user_in.email,
        first_name=user_in.first_name,
        last_name=user_in.last_name,
        password=user_in.password,
        role=user_in.role,
        username=user_in.username
    )