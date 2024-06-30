from pydantic import BaseModel, Field
from typing import Optional, Set
from enum import Enum
from services import departmentServices as ds

response = ds.get_departments()
departments = response.json()['data']

def create_enum(name, values):
    return Enum(name, values)

department_names = {dept['name'] : f"{i+1} - {dept['name'].upper()}" for i, dept in enumerate(departments)}
SelectionValue = create_enum('SelectionValue', department_names)


class ProductModel(BaseModel):
    product_name: str = Field(..., title='Nome do Produto')
    product_description: Optional[str] = Field(
        None, title='Descrição do Produto'
    )
    buy_price: float = Field(
        ..., title='Preço de Compra'
    )
    sale_price: float = Field(
        ..., title='Preço de Venda'
    )
    stock: float = Field(..., title='Estoque')
    department_id: SelectionValue = Field( # type: ignore
        ..., title='Departamento do Produto'
    )


class ProductGet(BaseModel):
    product_name: Optional[str] = Field(
        None, description='The name of the product'
    )
    product_description: Optional[str] = Field(
        None, description='The description of the product'
    )
    department_id: Optional[int] = Field(
        None,
        description='The ID of the department associated with the products',
    )
    buy_price: Optional[float] = Field(
        None,
        description='The buying price of the product, if negative use <= else >=',
    )
    sale_price: Optional[float] = Field(
        None,
        description='The selling price of the product, if negative use <= else >=',
    )
    stock: Optional[float] = Field(
        None,
        description='The stock quantity of the product, if negative use <= else >=',
    )
