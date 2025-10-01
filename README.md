# Using dev Container in VSCode

## Introduction to Container in VSCode
The following guide is created to use docker container in VSCode. This is created because Anaconda has stopped building conda packages for Intel Macs. An alternative is to run docker container as the development platform.

This feature also expose VSCode capabilities on development on remote system and containers. We do not use the official microsoft dev containers. The setup the Microsoft dev-container is easier and it include a persistent volume for storage. However, it is difficult to access the volume without docker software. So one of our objective is to create a docker environment that uses local Mac folder as the data source and attached to the docker environment. We also use Ubuntu instead of Debian so as to create similar environment as Windows WSL users. 

## Docker Features
- Docker OS: Ubuntu (version: 24.04)
- Software: miniconda for Linux
- A default user `devuser` was created during the build.
- We do not use the official miniconda docker image as we are trying to create an image similar to WSL for windows user. 
- The folder `dev` can be placed in any place user desired.
- The docker filer and the shell scripts are created to connect the docker container with the folder dev.


## Hardware
- This has been tested on Intel Macs from 2019 onwards.


## Software Requirements
- VSCode installed
- Docker for Mac installed

## Folder Structure - `dev`
The main folder is `dev`, listed below is the folder structure
```css
.
├── .devcontainer
    ├── devcontainer.json
    ├── Dockerfile
    ├── docker_build.sh    
    └── docker_run.sh
└── # You can place any development project or git repository in this folder.   
```

All the docker related files and the shell scripts are contained in the folder .devcontainer.


## Installation Steps

1. Run your docker app.

2. Open a terminal and navigate to this folder `vscode-dev-container`.

3. Copy the folder `dev` to your local drive e.g. `cp dev /Users/your_path/`

```bash
cp -R source_folder destination_folder

# Example
cp -R dev/ ~/Downloads/dev
```

Note: you can also use `Finder` to perform this action.

4. Change the permission of the shell script to execution mode.

```bash
chmod +x docker_build.sh
chmod +x docker_run.sh
```

5. Check the shell script and change the mount drive to your local path. I use `/Users/aiml/Documents/dev` and mount to `/home/devuser/workspace`. You need to change to your local path. There are 2 files to be change:
- `docker_run.sh`
- `devcontainer.json`

6. Run `docker_build.sh` to build a docker image. You need to do it once. However, you need to rebuild whenever you made changes to `Dockerfile` or `devcontainer.json`. You need to be in the folder `.devcontainer` to run the build script.

```bash
./docker_build.sh
```

7. Run `docker_run.sh` to run the container when ever it is stopped. You need to rerun the script if you made changes to the file `docker_run.sh`. **DO NOT RUN** this script if you have run it previously. You can run this command in the dev folder.

```bash
./.devcontainer/docker_run.sh
```

8. To re-run a stopped container, you can hit the `play icon` :arrow_forward: either in the docker software are in the docker extension in VSCode.

> Final Note: You can also change the image name and container name also the default user of the container.

