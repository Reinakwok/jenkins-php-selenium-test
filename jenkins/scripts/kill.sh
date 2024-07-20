#!/usr/bin/env bat

set -x
docker kill my-apache-php-app
docker rm my-apache-php-app
