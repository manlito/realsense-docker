# RealSense docker

This a setup so you can run RealSense-Viewer on docker. And potentially, you can also this to develop.

## Prerequisites

- Docker running on Linux
- A Docker setup that can run OpenGL. 

Now, if you have tried to run OpenGL apps inside docker, it is always a pain and pretty common you get errors `libGL error: No matching fbConfigs or visuals found` and `libGL error: failed to load driver: swrast`. I have a solution for that: use `nvidia/opengl:1.0-glvnd-runtime-ubuntu18.04`. That is in our Dockerfile. Yet, *you DON'T need an NVIDIA GPU to make it work*. 

## How to use

First, build the image running

```
make build
```

When done, you can launch the image

```
make run
```

First thing you want to do run when inside container, is calling `realsense-viewer`. That should be available globally

## How it works

I'm following steps from (Realsense)[https://github.com/IntelRealSense/librealsense/blob/development/doc/distribution_linux.md]. [docker-compose.yml] is helping to launch docker in `privileged` mode. I made this for ease, so we let the container see all our devices. 

`make run` helps launching that docker compose. By default, it will create a folder named `data/` relative to this path. That path is mounted inside the container as `/root/Documents`, which is the default storage folder for `realsense-viewer`. So,if you hit record, you should have `.bag` files mapped to your `data/` path. You can override that path by running

```
make run data_dir=/some/path/I/want
```
