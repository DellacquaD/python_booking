from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from .base import Base
from .state import State

class City(Base):
    __tablename__ = 'city'

    city_id = Column(Integer, primary_key=True)
    name = Column(String(255))
    state_id = Column(Integer, ForeignKey('state.state_id'))

    state = relationship("State", back_populates="cities")