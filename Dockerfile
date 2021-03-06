FROM hotio/base@sha256:e4b441eeb9faf8ab5fee10395a92f4965ae1945bd427af6049e48c5b47a475e9

EXPOSE 6789

RUN apk add --no-cache python3

# install app
RUN runfile="/tmp/app.run" && curl -fsSL -o "${runfile}" "https://github.com/nzbget/nzbget/releases/download/v21.0/nzbget-21.0-bin-linux.run" && sh "${runfile}" --destdir "${APP_DIR}" && rm "${runfile}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
