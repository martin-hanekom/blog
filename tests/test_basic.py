import pytest
from context import blog


@pytest.fixture
def app():
    return blog.app


@pytest.mark.asyncio
async def test_api(app):
    request, response = await app.asgi_client.get("/api")
    assert request.method.lower() == "get"
    assert response.body == b"api index."
    assert response.status == 200


"""
def test_docs(app):
    request, response = app.get("/docs")
    assert request.method.lower() == "get"
    assert response.body == b"docs index"
    assert response.status == 200
"""
