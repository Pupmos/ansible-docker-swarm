# Snapshot

A snapshot node is a standard worker node that's intended to only have snapshot containers scheduled on it.

To setup a snapshot node, run:

```console
SWARM_ADDR=<swarm_addr> \
DD_API_KEY=<dd_api_key> \
PROVIDER=<provider> \
TARGET=<target> \
make snapshot
```

where:

| Param          | Description                                                                                            | Required |
|----------------|--------------------------------------------------------------------------------------------------------|----------|
| `<swarm_addr>` | The IP address that swarm should listen to (ideally this is a private address on the host).            | `true`   |
| `<dd_api_key>` | The DataDog API key.                                                                                   | `false`  |
| `<provider>`   | The provider being used (`mevspace` or `ovhcloud`).                                                    | `false`  |
| `<target>`     | The IP address of the host to run the playbook against (all hosts will be configured if not provided). | `false`  |


e.g.:

```console
SWARM_ADDR=192.168.0.254 \
DD_API_KEY=0gD04PXCnLk0CYNHdamJ7lylKs5uMZkJ \
PROVIDER=ovhcloud \
TARGET=1.2.3.4 \
make snapshot
```
