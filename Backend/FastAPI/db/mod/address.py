from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from .base import Base

class Address(Base):
    __tablename__ = 'address'

    address_id = Column(Integer, primary_key=True)
    number = Column(String(255))
    street = Column(String(255))
    city_id = Column(Integer, ForeignKey('city.city_id'))

    city = relationship("City", back_populates="addresses")
    users = relationship("User", back_populates="address")