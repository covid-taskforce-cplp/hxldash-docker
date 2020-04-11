FROM python:2.7-buster
LABEL maintainer="Emerson Rocha <rocha@ieee.org>"

# @see https://hub.docker.com/_/python
# @see https://github.com/docker-library/docs/tree/master/python#how-to-use-this-image
# @see https://github.com/HXLStandard/hxl-proxy/blob/master/Dockerfile

# File initialy based on # @see https://github.com/fititnt/uwazi-docker/blob/master/Dockerfile

## Install common software
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
  bzip2 \
  dh-autoreconf \
  git

# ## Download Uwazi v1.4
# RUN git clone -b v1.4 --single-branch --depth=1 https://github.com/huridocs/uwazi.git /home/node/uwazi/ \
#   && chown node:node -R /home/node/uwazi/ \
#   && cd /home/node/uwazi/ \
#   && yarn install \
#   && yarn production-build

# RUN git clone -b master --single-branch --depth=1 https://github.com/SimonbJohnson/quickX3.git /usr/src/app/
RUN git clone -b adding-populate-database-command --single-branch --depth=1 https://github.com/SimonbJohnson/quickX3.git /usr/src/app/
# RUN git clone -b adding-populate-database-command --single-branch --depth=1 https://github.com/SimonbJohnson/quickX3.git /usr/src/app/ \
#   && chown node:node -R /home/node/uwazi/ \
#   && cd /home/node/uwazi/ \
#   && yarn install \
#   && yarn production-build

WORKDIR /usr/src/app/
COPY settings.py ./quickx3/
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

#COPY --chown=node:node docker-entrypoint.sh /docker-entrypoint.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/docker-entrypoint.sh"]
# RUN /docker-entrypoint.sh

# CMD [ "python", "./manage.py", "runserver", "0.0.0.0:8000" ]