import pytest
from context import blog


@pytest.fixture
def app():
    return blog.app


@pytest.mark.asyncio
async def test_basic_test_client(app):
    request, response = await app.asgi_client.get("/")
    assert request.method.lower() == "get"
    assert response.body == b"Blog index"
    assert response.status == 200
