from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from .base import Base
from .country import Country

class State(Base):
    __tablename__ = 'state'

    state_id = Column(Integer, primary_key=True)
    name = Column(String(255))
    country_id = Column(Integer, ForeignKey('country.country_id'))

    country = relationship("Country", back_populates="states")