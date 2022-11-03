Docker template for Deep ML

https://catalog.ngc.nvidia.com/orgs/nvidia/containers/pytorch

## Prerequisites

Using the PyTorch NGC Container requires the host system to have the following installed:
 * Docker Engine
 * NVIDIA GPU Drivers
 * NVIDIA Container Toolkit
 * Docker compose plugin: https://docs.docker.com/compose/install/linux/


## Setup

### docker-compose.yaml
set `container_name`, `image`, `environment`, `volumes`, `ports`


### Dockerfile
**ATTENTION!** Set `USER_UID` to match your own UID. That way, your docker user inherit's your permissions. (run `id` in host terminal)


### pkglist.txt

Ubuntu packages that you would like to install during the image build.


### requirements.txt

Python packages that you yould like to install during the image build.

## Usage

After you finish the setup, run: `docker compose up -d`


Then you can connect to the running container with: `docker exec -it <container> bash`


Stop the container with `docker container stop <container>`


Then start again with `docker compose up -d` Your files should remain as you left them.


## Remote debugging (with vscode)

 1. Bottom left corner blue square -> connect to host via SSH.  (if you use remote server)
 2. Then bottom left corner blue square -> attach to running container.

    **Note:** If you configured your `~/.ssh/config` file, then vscode offers your hosts automatically:
    https://linuxize.com/post/using-the-ssh-config-file/
