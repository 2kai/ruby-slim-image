FROM ruby:2.4-slim-stretch

LABEL maintainer="sasha klepikov <kai@list.ru>"

RUN chgrp -R root /usr/local

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        wget \
        gpg

RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main' > /etc/apt/sources.list.d/pgdg.list

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
        cron \
        less \
        locales \
        pdftk \
        openjdk-8-jre-headless \
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
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN gem install bundler -v 1.17.3

RUN cp /usr/share/zoneinfo/Europe/Tallinn /etc/localtime

