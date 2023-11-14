# Docker boost library

![Build Status](https://github.com/maxkratz/docker_boost/actions/workflows/build-and-push.yml/badge.svg?branch=main)

*Unofficial* [boost](https://www.boost.org/) Dockerfile for various versions.
Prebuild images can be found at this [Dockerhub repository](https://hub.docker.com/r/maxkratz/boost).


## Quickstart
After installing [Docker](https://docs.docker.com/get-docker/), just run the following command inside your workspace.
It will mount the current directory to `/data` inside the container.
This path will be used as working directory as defined in the Dockerfile.

```sh
docker run --rm -it -v ${PWD}:/data maxkratz/boost:latest bash
```

If you have a Makefile defined just run the following command from your workspace:

```sh
docker run --rm -it -v ${PWD}:/data maxkratz/boost:latest make
```


## Dockerfiles
The Dockerfiles can be found at the [Github repository](https://github.com/maxkratz/docker_boost).


## What gets installed in this image?
The following packages are installed in this Docker image:

* Some utility packages like wget and build essentials etc.
* [boost](https://www.boost.org/) (thats the whole point ...)


## Issues & Contribution
If you find any problems, bugs or missing packages, feel free to open an [issue on Github](https://github.com/maxkratz/docker_boost/issues).
