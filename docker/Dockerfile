FROM influxdb:2.5-alpine
RUN apk add --no-cache aws-cli

COPY backup.sh /backup.sh

CMD [ "bash", "-c", "/backup.sh" ]
