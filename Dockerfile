FROM python:3.9.5-alpine
MAINTAINER Avalon Hope <Avalon>

ENV PYTHONUNBUFFERED 1

COPY ./requirement.txt /requirement.txt

RUN apk add --update --no-cache postgresql-client jpeg-dev
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev
# RUN apk add --no-cache python3-pip

RUN pip install -r /requirement.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR  /app
COPY ./app /app

# Dir for storing media files uploaded by users
RUN mkdir -p /vol/web/media

# Dir for storing static files (eg. css, js, etc.)
RUN mkdir -p /vol/web/static

RUN adduser -D user

# Change ownership of the vol directory to the user
RUN chown -R user:user /vol/

# Add ownership permission of the web directory to the user
RUN chmod -R 775 /vol/web/

USER user