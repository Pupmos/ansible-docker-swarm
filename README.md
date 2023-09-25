# Pupmos/ansible-docker-swarm

An Ansible playbook for Docker Swarm clusters.

## Prerequisites

- [Python3](https://realpython.com/installing-python)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

_Ideally ansible should be installed via [pip](https://pip.pypa.io/en/stable/), the package installer for python._

## Assumptions

This README assumes that you've already installed `debian` or `ubuntu` onto the target environment/s.

## Setup

1. Install the required git submodule dependencies:

```console
git submodule update --init
```

2. Install the ansible `community.general` collection:

```console
ansible-galaxy collection install community.general
```

3. Rename the `hosts.example` file in `inventory/` to `hosts`:

```console
cp inventory/hosts.example inventory/hosts
```

4. Create the target variable files using the template `example.yml` as follows:

```console
echo "master.yml worker.yml snapshot.yml" | xargs -n 1 cp example.yml
```

## Types

The following node types are supported:

- [Master](MASTER.md)
- [Worker](WORKER.md)

## Todo

* Support for Prometheus, Grafana and the Node Exporter, as replacements for DataDog.
