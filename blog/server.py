#!/usr/bin/env python3.10

from sanic import Sanic
from sanic.response import HTTPResponse, text
from sanic.request import Request
from sanic_ext import render

app = Sanic("Blog")


@app.get("/")
@app.ext.template("index.html")
async def index(request: Request) -> HTTPResponse:
    return await render(context={"seq": ["one", "two"]}, status=400)


@app.get("/api")
async def api_index(request: Request) -> HTTPResponse:
    return text("api index")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000, access_log=False)
