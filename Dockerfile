FROM --platform=linux/arm/v7 alpine:3.12

WORKDIR /

COPY ./release/static-rust /static-rust

RUN chmod 0755 /static-rust

ENV USER=server
ENV GROUP=servgroup
ENV UID=12345
ENV GID=23456
ENV STATIC_DIR="/static"

RUN addgroup -g "${GID}" "${GROUP}"

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup "${GROUP}" \
    --no-create-home \
    --uid "${UID}" \
    "${USER}"

RUN mkdir "${STATIC_DIR}"
RUN chmod -R 0755 "${STATIC_DIR}"
RUN chown -R "${USER}:${GROUP}" "${STATIC_DIR}" 

USER "${USER}"

ENTRYPOINT ["/static-rust"]
