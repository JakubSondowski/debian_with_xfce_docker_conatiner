# Debian with XFCE Docker Container

## Shared folder (optional)

If you want to create a shared folder, run:

$ mkdir -p ~/Docker/Debian_With_Desktop/workdir

If you do not need a shared folder, you can comment out the relevant lines in the docker-compose.yml file.

## Start the container

$ sudo docker compose up

## Access the desktop

Once the setup is complete, open:

http://localhost:2137/vnc.html

## Notes

- No browser or IDE is preinstalled.
- Additional software can be installed by downloading it into the shared folder and installing it from inside the container.

## Default user and password

- Can be found in dockerfile

