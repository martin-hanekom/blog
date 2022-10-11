#!/usr/bin/env python3.10

from sanic import Sanic
from sanic.response import text

app = Sanic("Blog")

@app.get("/")
async def index(request):
    return text("Blog index")
