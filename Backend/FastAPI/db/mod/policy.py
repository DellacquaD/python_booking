from sqlalchemy import Column, Integer, String, ForeignKey
from .base import Base

class Policy(Base):
    __tablename__ = 'policy'

    policy_id = Column(Integer, primary_key=True)
    cancellation = Column(String)
    rules = Column(String)
    security = Column(String)

    product = relationship("Product", back_populates="policy")