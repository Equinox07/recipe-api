FROM python:3.9.5-alpine
MAINTAINER Avalon Hope <Avalon>

ENV PYTHONUNBUFFERED 1

COPY ./requirement.txt /requirement.txt

RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
# RUN apk add --no-cache python3-pip

RUN pip install -r /requirement.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR  /app
COPY ./app /app

RUN adduser -D user
USER user