FROM newrelic/infrastructure:latest

RUN apk update && apk upgrade && apk add --update expect && rm -rf /var/cache/apk/*

RUN ln -s / /host
RUN ln -s /run/balena-engine.sock /host/var/run/docker.sock

# StorageAgent has some problems priniting plenty of WARNs, they are skipped with `grep -v`
# `|` makes the `newrelic-infra-service` drop the output colors, `unbuffer` fixes it
CMD unbuffer /usr/bin/newrelic-infra-service | grep -v "can't get disk usage. Ignoring it"
