FROM verdaccio/verdaccio:4.2.2

USER root
ENV NODE_ENV production
RUN npm i -g npm@6.9 && npm i && npm install verdaccio-ldap@npm:@deinstapel/verdaccio-ldap verdaccio-groupnames@1.0.4-0 verdaccio-aws-s3-storage@8.1.0
USER $VERDACCIO_USER_ID
