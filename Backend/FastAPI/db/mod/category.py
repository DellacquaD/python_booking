from sqlalchemy import Column, Integer, String
from .base import Base

class Category(Base):
    __tablename__ = 'category'

    category_id = Column(Integer, primary_key=True)
    description = Column(String(255))
    image_url = Column(String(255))
    quantity = Column(String(255))
    title = Column(String(255))