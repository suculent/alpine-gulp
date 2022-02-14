FROM node:14-alpine

LABEL cloud.thinx.maintainer="Matej Sychra" \
      cloud.thinx.version="0.4.0"

USER root

RUN \
  apk add --no-cache dumb-init && \
  yarn global add gulp-cli

USER    node
WORKDIR /build
VOLUME  /build

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "gulp" ]
