FROM verdaccio/verdaccio:4.2.2

USER root
ENV NODE_ENV production
RUN npm i && npm install verdaccio-ldap-done-right@0.0.1-8 verdaccio-groupnames@1.0.4-1 verdaccio-aws-s3-storage@8.1.0
USER $VERDACCIO_USER_ID
