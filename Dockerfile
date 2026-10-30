FROM node:24-alpine AS builder

RUN mkdir -p /verdaccio/plugins \
  && cd /verdaccio/plugins \
  && npm install --install-strategy=nested --no-bin-links --omit=dev --omit=optional --no-audit --no-fund \
    verdaccio-aws-s3-storage@12.1.3 \
    verdaccio-groupnames@2.0.0 \
    verdaccio-ldap-done-right@0.1.0

FROM verdaccio/verdaccio:7.0.2

COPY --chown=$VERDACCIO_USER_UID:root --from=builder /verdaccio/plugins/node_modules/verdaccio-aws-s3-storage /verdaccio/plugins/verdaccio-aws-s3-storage
COPY --chown=$VERDACCIO_USER_UID:root --from=builder /verdaccio/plugins/node_modules/verdaccio-groupnames /verdaccio/plugins/verdaccio-groupnames
COPY --chown=$VERDACCIO_USER_UID:root --from=builder /verdaccio/plugins/node_modules/verdaccio-ldap-done-right /verdaccio/plugins/verdaccio-ldap-done-right
