# debian_with_xfce_docker_conatiner
# if you want to create a shared folder use
$ mkdir - /home/$(echo $USER)/Docker/Debian_With_Desktop/workdir

# otherwise you shall comment a few lines in docker-compose which use it

# start with:
$ sudo docker compose up

# when setting up is finished use
http://localhost:2137/vnc.html
