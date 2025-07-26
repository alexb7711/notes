<!-- :docker: -->
# Docker Compose Overview

Docker compose is a tool for defining and running multi-container applications. It simplifies the control of the entire application stack, making it easy to manage services, networks, and volumes in a single YAML configuration file. After the file is defined, a single command will start all the services specified in the configuration file. The compose file has the ability to

- Start, stop, and rebuild services
- View the status of running services
- Steam the log output of running services
- Run a one-off command on a service

# Why use Compose?

## Key Benefits of Docker Compose

- Simplified control: Docker Compose allows you to define and manage multi-container applications in a single YAML file. This simplifies the complex task of orchestrating and coordinating various services, making it easier to manage and replicate your application environment.
- Efficient collaboration: Docker Compose configuration files are easy to share, facilitating collaboration among developers, operations teams, and other stakeholders. This collaborative approach leads to smoother workflows, faster issue resolution, and increased overall efficiency.
- Rapid application development: Compose caches the configuration used to create a container. When you restart a service that has not changed, Compose re-uses the existing containers. Re-using containers means that you can make changes to your environment very quickly.
- Portability across environments: Compose supports variables in the Compose file. You can use these variables to customize your composition for different environments, or different users.
- Extensive community and support: Docker Compose benefits from a vibrant and active community, which means abundant resources, tutorials, and support. This community-driven ecosystem contributes to the continuous improvement of Docker Compose and helps users troubleshoot issues effectively.

## Common use cases of Docker Compose

### Development Environments

- Run application in an isolated environment
- The compose file can be used to document and configure all of the applications service dependencies
- This can be used to simplify a complex development environment into a single compose file that configures the environment (and I think they are making the argument that the file is self documenting)

### Automated Testing Environments

- Compose provides a convenient way to create and destroy isolated testing environments

```shell
$ docker compose up -d
$ ./run_tests
$ docker compose down
```

# How Compose Works

## The Compose Application Model

Components of a compose are defined as services. A service is an abstract concept that is "instantiated" by creating running a docker image with a specified configuration.

These services communicate with each other through networks. A network is a platform capability abstraction to establish an IP route between containers within services. By default Compose sets up a single network for your app. Each container for a service joins the default network and is both reachable by other containers on that network, and discoverable by the service's name.

Services store and share persistent data in volumes. The Specification describes such data as high-level filesystem mounts with global options. Similar to volumes are configs. Configs are mounted as files into a container's filesystem. These options allow the application's behavior to adapt without having to recreate the docker image.

Secrets are a type of configuration data, but specifically for sensitive data that should not be exposed without security considerations.

# The Compose File

The default path for a compose file is `compose.yaml` and by default is assumed to be in the working directory.

Compose files support fragments and extensions. Fragments basically crate references to previous blocks in the YAML file. These blocks can then be reused.

```yaml
services:
  first:
    image: my-image:latest
    environment: &env
      - CONFIG_KEY
      - EXAMPLE_KEY
      - DEMO_VAR
  second:
    image: another-image:latest
    environment: *env
```

Extensions are basically user defined fields. Anything that starts with an `x-` is interpreted by Compose, but is silently ignores these fields if they are not recognized. Extensions in conjunction with fragments allows for modular compose files:

```yaml
x-env: &env
  environment:
    - CONFIG_KEY
    - EXAMPLE_KEY

services:
  first:
    <<: *env
    image: my-image:latest
  second:
    <<: *env
    image: another-image:latest
```

Even more interestingly, multiple compose files can be merged  together or one can simply include another compose file to be reused. That is to say, compose files are modular.

## CLI

Some of the key compose commands are:

- Start all services: `docker compose up`
- Stop and remove running services: `docker compose down`
- Monitor output of running containers: `docker compose logs`
- List all services along with current status: `docker compose ps`

# Example

An application is split into a frontend web application and a backend service.

The frontend is configured at runtime with an HTTP configuration file managed by infrastructure, providing an external domain name, and an HTTPS server certificate injected by the platform's secured secret store.

The backend stores data in a persistent volume.

Both services communicate with each other on an isolated back-tier network, while the frontend is also connected to a front-tier network and exposes port 443 for external usage.

![Example Image](2Q==.html)

```yaml
services:
  frontend:
    image: example/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    configs:
      - httpd-config
    secrets:
      - server-certificate

  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier

volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"

configs:
  httpd-config:
    external: true

secrets:
  server-certificate:
    external: true

networks:
  # The presence of these objects is sufficient to define them
  front-tier: {}
  back-tier: {}
```

# References

\- <https://docs.docker.com/compose/intro/compose-application-model/>
- <https://docs.docker.com/reference/compose-file/services/>
- <https://docs.docker.com/reference/compose-file/networks/>
- <https://docs.docker.com/reference/compose-file/configs/>
- <https://docs.docker.com/reference/compose-file/fragments/>
- <https://docs.docker.com/reference/compose-file/extension/>
