from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from .base import Base

class Reserve(Base):
    __tablename__ = 'reserve'

    reserve_id = Column(Integer, primary_key=True)
    check_in = Column(String)
    check_out = Column(String)
    start_time = Column(String)
    product_id = Column(ForeignKey('product.product_id'))
    user_id = Column(ForeignKey('user.user_id'))

    product = relationship("Product", back_populates="reserve")
    user = relationship("User", back_populates="reserve")
