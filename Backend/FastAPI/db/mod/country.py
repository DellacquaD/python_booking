from sqlalchemy import Column, Integer, String
from .base import Base


class Country(Base):
    __tablename__ = 'country'

    country_id = Column(Integer, primary_key=True)
    name = Column(String(255))