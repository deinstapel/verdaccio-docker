FROM verdaccio/verdaccio:4.0.3

USER root
ENV NODE_ENV production
RUN npm i && npm install verdaccio-ldap verdaccio-groupnames
USER $VERDACCIO_USER_ID
