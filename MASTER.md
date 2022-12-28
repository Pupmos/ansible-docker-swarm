# Master

## Primary

If you're setting up the swarm for the first time (a master does not already exist), then run:

```console
SWARM_ADDR=<swarm_addr> \
DD_API_KEY=<dd_api_key> \
PROVIDER=<provider> \
TARGET=<target> \
make master
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
make master
```

Once up and running, you need to update the files in `group_vars/` with the appropriate join tokens. The tokens can be obtained by running (on the master you just configured):

```console
docker swarm join-token --quiet manager
docker swarm join-token --quiet worker
```

## Secondary

It's strongly recommended that you run multiple master nodes. Before adding additional masters, you must update `group_vars/master.yml` with the IP addresses of all other masters currently running. This is so that your secondary knows which nodes to talk to.

To add another master node to the swarm, run:

```console
SWARM_ADDR=<swarm_addr> \
JOIN_EXISTING=<join_existing> \
DD_API_KEY=<dd_api_key> \
PROVIDER=<provider> \
TARGET=<target> \
make master
```

where:

| Param             | Description                                                                                            | Required |
|-------------------|--------------------------------------------------------------------------------------------------------|----------|
| `<swarm_addr>`    | The IP address that swarm should listen to (ideally this is a private address on the host).            | `true`   |
| `<join_existing>` | Join an existing swarm (optional, but is required when adding a secondary master).                     | `false`  |
| `<dd_api_key>`    | The DataDog API key.                                                                                   | `false`  |
| `<provider>`      | The provider being used (`mevspace` or `ovhcloud`).                                                    | `false`  |
| `<target>`        | The IP address of the host to run the playbook against (all hosts will be configured if not provided). | `false`  |

e.g.:

```console
SWARM_ADDR=192.168.0.1 \
JOIN_EXISTING=true \
DD_API_KEY=0gD04PXCnLk0CYNHdamJ7lylKs5uMZkJ \
PROVIDER=ovhcloud \
TARGET=1.2.3.5 \
make master
```

If the config in `group_vars/master.yml` is not set correctly, then your master will be unable to connect.
