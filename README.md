# newrelic-infrastructure-for-balena

New Relic Infrastructure Agent Docker image for Balena Cloud

## How to run?

```yaml
version: '2'
services:
  new_relic:
    image: bartoszadamczyk/newrelic-infrastructure-for-balena:latest
    restart: unless-stopped
    privileged: true
    pid: host
    cap_add:
      - SYS_PTRACE
    network_mode: host
    environment:
      NRIA_LICENSE_KEY: NRIA_LICENSE_KEY
      NRIA_OVERRIDE_HOSTNAME_SHORT: HOSTNAME
    labels:
      io.balena.features.dbus: '1'
      io.balena.features.sysfs: '1'
      io.balena.features.procfs: '1'
      io.balena.features.balena-socket: '1'
```

Remember to use your `NRIA_LICENSE_KEY` and `NRIA_OVERRIDE_HOSTNAME_SHORT`.

Read more:

- [Docker container for infrastructure monitoring](https://docs.newrelic.com/docs/infrastructure/install-infrastructure-agent/linux-installation/docker-container-infrastructure-monitoring/)
- [Balena Cloud docker labels](https://www.balena.io/docs/reference/supervisor/docker-compose/#labels)
- [Infrastructure agent settings](https://docs.newrelic.com/docs/infrastructure/install-infrastructure-agent/configuration/infrastructure-agent-configuration-settings/)
- [newrelic-infra-template.yml.example](https://github.com/newrelic/infrastructure-agent/blob/master/assets/examples/infrastructure/newrelic-infra-template.yml.example)

Bind mounts the host's Docker daemon socket to the container. This allows the agent to connect to the Engine API via the
Docker daemon socket to collect the host's container data.

## Useful

- `NRIA_OVERRIDE_HOST_ROOT: /host` - can be passed to change the root path that is used by newrelic agent inside the
  container.
- `NRIA_METRICS_STORAGE_SAMPLE_RATE: -1` - can be pass to stop StorageAgent reporting. 
