from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from .base import Base
from .product import Product

class Image(Base):
    __tablename__ = 'image'

    image_id = Column(Integer, primary_key=True)
    image_url = Column(String(255), nullable=False)
    title = Column(String(255))
    product_id = Column(Integer, ForeignKey('product.product_id'))

    product = relationship("Product", back_populates="images")