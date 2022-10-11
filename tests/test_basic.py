from blog import server


async def test_basic_test_client(app):
    request, response = await server.app.test_client.get("/")
    assert request.method.lower() == "get"
    assert response.body == b"Blog index"
    assert response.status == 200
