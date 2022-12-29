# syntax=docker/dockerfile:1.4
FROM --platform=$BUILDPLATFORM python:3.10 AS builder

WORKDIR /flask_app

COPY requirements.txt /flask_app
RUN --mount=type=cache,target=/root/.cache/pip \
    pip3 install -r requirements.txt

COPY . /flask_app
EXPOSE 5000
ENTRYPOINT ["python3"]
CMD ["flask_app.py"]

FROM builder as dev-envs

# install Docker tools (cli, buildx, compose)
COPY --from=gloursdocker/docker / /