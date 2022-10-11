import pytest
from context import blog
from sanic_testing import SanicTestClient


@pytest.fixture
def app():
    return SanicTestClient(blog.app)


def test_api(app):
    request, response = app.get("/api")
    assert request.method.lower() == "get"
    assert response.body == b"api index"
    assert response.status == 200


def test_docs(app):
    request, response = app.get("/docs")
    assert request.method.lower() == "get"
    assert response.body == b"docs index"
    assert response.status == 200
