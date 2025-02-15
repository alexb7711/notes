# Dockerfile Overview

Docker builds images by reading the instructions from a Dockerfile. A Dockerfile is a text file containing instructions for building your source code.

## Filename

The default filename is `Dockerfile`. When the default filename is used, when you run `docker build`, the `Dockerfile` is utilized. 

# Docker Images

Docker images consist of layers. Each layer is the result of a build instruction in the Dockerfile. Layers are stacked sequentially, and each one is a delta representing the changes applied to the previous layer.

## Example

```Docker
# Instructs the docer builder what version 
# syntax to use.
# `docker/dockerfile:1` points to the
# latest release of the version 1 syntax.
# syntax=docker/dockerfile:1

# Specify the OS:VERSION used in the Docker image
# There are public images available at the Docker Hub.
# Local images may also be used.
FROM ubuntu:22.04

# install app dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install flask==3.0.*

# install app
# By doing this, `hello.py` is added to the build context of
# the Docker image. The build context is the set of files
# that the build can access.
COPY hello.py /

# final configuration
# If the application uses enviornment variables, you can
# set them this way.
ENV FLASK_APP=hello

# Mark that the final image has a service listening on port 8000
EXPOSE 8000

# Start the application
# The `CMD` instruction sets the command that is run when the
# user starts a container based on this image.
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8000"]
```

# Building

To build the container image using the Dockerfile created previously, you would run the command

```shell
docker build -t test:latest .
```

The `-t test:latest`  option specifies the name and tag of the image.

  
The single dot at the end of the command sets the build context to the current directory. This means that the `hello.py` file needs to be in the same directory as to where tho command is being invoked.

After the image has been built, the application can be run as a container with

```
docker run -p 127.0.0.1:8000:8000 test:latest
```

This publishes the container's port `8000` to `https://localhost:8000` on the Docker host.

# Common Instructions

| **Instruction**         | **Description**                                                                                                                                                                                          |
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `FROM <image>`        | Defines a base for your image.                                                                                                                                                                       |
| `RUN <command>`       | Executes any commands in a new layer on top of the current image and commits the result. `RUN` also has a shell form for running commands.                                                             |
| `WORKDIR <directory>` | Sets the working directory for any `RUN`, `CMD`, `ENTRYPOINT`, `COPY`, and `ADD` instructions that follow it in the Dockerfile.                                                                                |
| `COPY <src> <dest>`   | Copies new files or directories from `<src>` and adds them to the filesystem of the container at the path `<dest>`.                                                                                      |
| `CMD <command>`       | Lets you define the default program that is run once you start the container based on this image. Each Dockerfile only has one `CMD`, and only the last `CMD` instance is respected when multiple exist. |

# References

\- <https://docs.docker.com/build/concepts/dockerfile/>

\- <https://docs.docker.com/build/concepts/context/>