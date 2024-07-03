from app import create_app
from pytest import fixture, mark
from models import Base
from datetime import datetime

app = create_app(testing=True)


@fixture(scope='session')
def client():
    with app.test_client() as client:
        yield client
        Base.metadata.drop_all(app.db.engine)


# GWT - Given, When, Then
def test_given_not_products_when_get_products_then_empty_data(client):
    response = client.get('/products')
    assert response.status_code == 200
    assert response.json == {'message': 'Filtered Products', 'data': []}


def test_given_post_products_when_get_reponse_then_added_product(client):
    data = {
        'product_name': 'Test',
        'product_description': 'Test',
        'buy_price': 10.0,
        'sale_price': 20.0,
        'stock': 10.0,
        'department_id': 1,
    }
    now = datetime.now().strftime('%a, %d %b %Y %H:%M:%S GMT')
    expect_data = {
        'id': 1,
        'product_name': 'Test',
        'product_description': 'Test',
        'buy_price': 10.0,
        'sale_price': 20.0,
        'stock': 10.0,
        'department_id': 1,
        'created_at': now,
        'updated_at': now,
    }
    expected = {'message': 'Product added', 'data': expect_data}

    response = client.post('/product', json=data)
    assert response.status_code == 201
    assert response.json == expected

def test_given_post_products_when_not_department_id_then_deparment_not_found(client):
    data = {
        'product_name': 'Test',
        'product_description': 'Test',
        'buy_price': 10.0,
        'sale_price': 20.0,
        'stock': 10.0,
        'department_id': 0,
    }
    now = datetime.now().strftime('%a, %d %b %Y %H:%M:%S GMT')
    expect_data = {
        'id': 1,
        'product_name': 'Test',
        'product_description': 'Test',
        'buy_price': 10.0,
        'sale_price': 20.0,
        'stock': 10.0,
        'department_id': 1,
        'created_at': now,
        'updated_at': now,
    }
    expected = {'message': 'Department not found'}

    response = client.post('/product', json=data)
    assert response.status_code == 404
    assert response.json == expected