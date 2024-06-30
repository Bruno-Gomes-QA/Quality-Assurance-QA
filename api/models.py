from sqlalchemy import (
    Column,
    DECIMAL,
    ForeignKey,
    Integer,
    String,
    TIMESTAMP,
    text,
)
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
metadata = Base.metadata


class Department(Base):
    __tablename__ = 'departments'

    id = Column(Integer, primary_key=True)
    name = Column(String(255))
    description = Column(String(1000))
    created_at = Column(TIMESTAMP, server_default=text('CURRENT_TIMESTAMP'))
    updated_at = Column(
        TIMESTAMP,
        server_default=text('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'),
    )

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'description': self.description,
            'created_at': self.created_at,
            'updated_at': self.updated_at,
        }


class Product(Base):
    __tablename__ = 'products'

    id = Column(Integer, primary_key=True)
    product_name = Column(String(255))
    product_description = Column(String(1000))
    buy_price = Column(DECIMAL(10, 2))
    sale_price = Column(DECIMAL(10, 2))
    stock = Column(DECIMAL(10, 2))
    created_at = Column(TIMESTAMP, server_default=text('CURRENT_TIMESTAMP'))
    updated_at = Column(
        TIMESTAMP,
        server_default=text('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'),
    )
    department_id = Column(ForeignKey('departments.id', ondelete='SET NULL'))

    department = relationship('Department')

    def serialize(self):
        return {
            'id': self.id,
            'product_name': self.product_name,
            'product_description': self.product_description,
            'buy_price': float(self.buy_price),
            'sale_price': float(self.sale_price),
            'stock': float(self.stock),
            'created_at': self.created_at,
            'updated_at': self.updated_at,
            'department_id': self.department_id,
        }
