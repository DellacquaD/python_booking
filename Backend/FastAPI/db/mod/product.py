from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from .base import Base
from .address import Address
from .category import Category
from .policy import Policy

class Product(Base):
    __tablename__ = 'product'

    product_id = Column(Integer, primary_key=True)
    description = Column(String(255))
    review = Column(String(255))
    scoring = Column(Integer)
    stars = Column(Integer)
    title = Column(String(255), nullable=False)
    address_address_id = Column(Integer, ForeignKey('address.address_id'))
    category_id = Column(Integer, ForeignKey('category.category_id'))
    policy_id = Column(Integer, ForeignKey('policy.policy_id'))

    address = relationship("Address", back_populates="products")
    category = relationship("Category", back_populates="products")
    policy = relationship("Policy", back_populates="product")
