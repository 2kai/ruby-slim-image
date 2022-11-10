FROM ruby:2.4-slim-buster

LABEL maintainer="sasha klepikov <kai@list.ru>"

RUN chgrp -R root /usr/local

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
        cron \
        less \
        locales \
        pdftk \
        openjdk-11-jre-headless \
        git \
        build-essential \
        libpq-dev \
        libsqlite3-dev \
        libcurl4-openssl-dev \
        file \
        curl \
        vim \
        imagemagick \
        libmagickwand-dev \
        wget \
        gpg \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN gem install bundler -v 1.17.3

RUN cp /usr/share/zoneinfo/Europe/Tallinn /etc/localtime

