# Commands

Packer commands for creating the Packer templates.

## Validate

Use these commands to validate the configuration files.

### Ubuntu Server (Jammy)

```bash
cd ./ubuntu-server-jammy
packer validate -var-file="../credentials.pkr.hcl" ./ubuntu-server-jammy.pkr.hcl
```

### Ubuntu Server (Jammy) Docker

```bash
cd ./ubuntu-server-jammy-docker
packer validate -var-file="../credentials.pkr.hcl" ./ubuntu-server-jammy-docker.pkr.hcl
```

## Build

Use these commands to build and create the templates in Proxmox.

### Ubuntu Server (Jammy)

```bash
cd ./ubuntu-server-jammy
packer build -var-file="../credentials.pkr.hcl" ./ubuntu-server-jammy.pkr.hcl
```

### Ubuntu Server (Jammy) Docker

```bash
cd ./ubuntu-server-jammy-docker
packer build -var-file="../credentials.pkr.hcl" ./ubuntu-server-jammy-docker.pkr.hcl
```
