# builder stage
FROM python:3.10.7-slim as builder

WORKDIR /opt
ENV VIRTUAL_ENV=/opt/venv
RUN python -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc

RUN pip install --upgrade pip >/dev/null 2>&1
COPY requirements.txt .
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /opt/wheels -r requirements.txt

# final stage
FROM python:3.10.7-slim

WORKDIR /opt
ENV VIRTUAL_ENV=/opt/venv
RUN python -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
EXPOSE 3000

COPY --from=builder /opt/wheels /wheels
COPY --from=builder /opt/requirements.txt .
RUN pip install --no-cache /wheels/*

COPY . .

CMD ["python", "blog/server.py"]
