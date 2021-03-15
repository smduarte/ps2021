# Stream Processing 2021
## Lab #1


### Preparing the environment
## Docker

We will use [Docker](www.docker.com) to virtualize the execution environment of the tool we will use.
### 1) Install Docker

Docker is available for Windows, Linux and macOS.

Download and install Docker for your platform [here](https://www.docker.com/get-started)
### 3) Create the bridge network
The bridge network will enable routing among the
docker containers with DNS name resolution.

`docker network create -d bridge psnet`
### 4) Launch the jupyter docker image...

`docker run --network psnet -p 8888:8888 -v $(pwd)/notebooks:/home/jovyan/work smduarte/ps2021-jupyter`

If all goes well the command will launch a jupyter instance available at:
[localhost:8888](http://localhost:8888). The exact location will be shown in the
output of the command.

Files created in the jupyter container will be found in the directory `notebooks` inside the (current) directory, i.e., the directory where the docker comand was run.
