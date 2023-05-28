from sqlalchemy import Column, Integer, String
from .base import Base

class Feature(Base):
    __tablename__ = 'feature'

    feature_id = Column(Integer, primary_key=True)
    name = Column(String(255))
