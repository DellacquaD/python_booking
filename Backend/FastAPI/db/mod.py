from sqlalchemy import Column, Integer, String, ForeignKey, Table
from sqlalchemy.orm import relationship
from sqlalchemy.orm import DeclarativeBase

class Base(DeclarativeBase):
    pass

class User(Base):
    __tablename__ = 'users'

    user_id = Column(Integer, primary_key=True)
    email = Column(String(255))
    first_name = Column(String(255))
    last_name = Column(String(255))
    password = Column(String(255))
    role = Column(String(255))
    username = Column(String(255))

    reserves = relationship("Reserve", back_populates="user")

class Address(Base):
    __tablename__ = 'address'

    address_id = Column(Integer, primary_key=True)
    number = Column(String(255))
    street = Column(String(255))
    city_id = Column(Integer, ForeignKey('city.city_id'))

    city = relationship("City", back_populates="addresses")
    products = relationship("Product", back_populates="address")

class Category(Base):
    __tablename__ = 'category'

    category_id = Column(Integer, primary_key=True)
    description = Column(String(255))
    image_url = Column(String(255))
    quantity = Column(String(255))
    title = Column(String(255))

    products = relationship("Product", back_populates="category")

    def to_dict(self):
        return {
            'category_id': self.category_id,
            'description': self.description,
            'imageUrl': self.image_url,
            'quantity': self.quantity,
            'title': self.title
        }

class City(Base):
    __tablename__ = 'city'

    city_id = Column(Integer, primary_key=True)
    name = Column(String(255))
    state_id = Column(Integer, ForeignKey('state.state_id'))

    state = relationship("State", back_populates="cities")
    addresses = relationship("Address", back_populates="city")

class Country(Base):
    __tablename__ = 'country'

    country_id = Column(Integer, primary_key=True)
    name = Column(String(255))

    states = relationship("State", back_populates="country")

class Feature(Base):
    __tablename__ = 'feature'

    feature_id = Column(Integer, primary_key=True)
    name = Column(String(255))
    products = relationship("Product", secondary="product_feature", back_populates="features")

class Image(Base):
    __tablename__ = 'image'

    image_id = Column(Integer, primary_key=True)
    image_url = Column(String(255), nullable=False)
    title = Column(String(255))
    product_id = Column(Integer, ForeignKey('product.product_id'))

    product = relationship("Product", back_populates="images")

class Policy(Base):
    __tablename__ = 'policy'

    policy_id = Column(Integer, primary_key=True)
    cancellation = Column(String)
    rules = Column(String)
    security = Column(String)

    product = relationship("Product", back_populates="policy")

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
    images = relationship("Image", back_populates="product")
    features = relationship("Feature", secondary="product_feature", back_populates="products")
    reserve = relationship("Reserve", back_populates="product")

class ProductPolicy(Base):
    __tablename__ = "product_policy"

    id = Column(Integer, primary_key=True, index=True)
    rules = Column(String)
    security = Column(String)
    cancellation = Column(String)

class Reserve(Base):
    __tablename__ = 'reserve'

    reserve_id = Column(Integer, primary_key=True)
    check_in = Column(String)
    check_out = Column(String)
    start_time = Column(String)
    product_id = Column(Integer, ForeignKey('product.product_id'))
    user_id = Column(Integer, ForeignKey('users.user_id'))

    product = relationship("Product", back_populates="reserve")
    user = relationship("User", back_populates="reserves")


class State(Base):
    __tablename__ = 'state'

    state_id = Column(Integer, primary_key=True)
    name = Column(String(255))
    country_id = Column(Integer, ForeignKey('country.country_id'))

    country = relationship("Country", back_populates="states")
    cities = relationship("City", back_populates="state")

# Tabla intermedia para la relación entre Product y Feature
product_feature = Table(
    'product_feature',
    Base.metadata,
    Column('product_id', Integer, ForeignKey('product.product_id')),
    Column('feature_id', Integer, ForeignKey('feature.feature_id')),
)