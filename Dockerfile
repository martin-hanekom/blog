FROM python:3.10.7-slim

ENV VIRTUAL_ENV=/opt/venv
RUN python -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
EXPOSE 3000
WORKDIR /opt

RUN pip install --upgrade pip >/dev/null 2>&1
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

CMD ["sanic", "blog.server.app", "--host=0.0.0.0"]
