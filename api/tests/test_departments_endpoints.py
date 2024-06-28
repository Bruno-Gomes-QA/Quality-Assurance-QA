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
def test_given_not_departments_when_get_deparments_then_empty_data(client):
    response = client.get('/departments')
    assert response.status_code == 200
    assert response.json == {'message': 'All Departments', 'data': []}


def test_given_post_departments_when_get_reponse_then_posted_department(client):
    data = {'name': 'Test', 'description': 'Test'}
    now = datetime.now().strftime('%a, %d %b %Y %H:%M:%S GMT')
    expect_data = {'id': 1, 'name': 'Test', 'description': 'Test', 'created_at': now, 'updated_at': now}
    expected = {'message': 'Department added', 'data': expect_data}
    
    response = client.post('/department', json=data)
    assert response.status_code == 201
    assert response.json == {'message': 'Department added', 'data': expect_data}
