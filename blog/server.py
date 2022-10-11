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
    return await text("api index")


@app.get("/docs")
async def docs_index(request: Request) -> HTTPResponse:
    return await text("docs index")
