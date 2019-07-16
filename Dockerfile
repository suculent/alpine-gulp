FROM node:10.16.0-alpine

LABEL cloud.thinx.maintainer="Matej Sychra" \
      cloud.thinx.version="0.3.0"

RUN \
  apk add --no-cache dumb-init && \
  npm install -g yarn && \
  yarn global add gulp-cli

USER    node
WORKDIR /build
VOLUME  /build

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "gulp" ]
