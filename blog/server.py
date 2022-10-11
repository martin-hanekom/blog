#!/usr/bin/env python3.10

from sanic import Sanic
from sanic.response import HTTPResponse, text
from sanic.request import Request

app = Sanic("Blog")


@app.get("/")
async def index(request: Request) -> HTTPResponse:
    return text("Blog index")
