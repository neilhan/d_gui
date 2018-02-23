#!/bin/bash

docker run --rm -it \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY \
	--device /dev/dri \
	--device /dev/snd \
	--device /dev/video0 \
	--device /dev/input \
	-v /etc/localtime:/etc/localtime:ro \
	--net=host \
        --user=$USER \
	--volume="/dev/shm:/dev/shm" \
        --volume="$PWD/home:/home" \
        --volume="/home/nhan2/bin:/home/nhan2/bin" \
        --volume="/home/nhan2/Downloads:/home/nhan2/Downloads" \
        --volume="/home/nhan2/Projects:/home/nhan2/Projects" \
        --volume="/home/nhan2/.m2:/home/nhan2/.m2" \
        --workdir="/home/$USER" \
	--privileged \
	d_gui # /usr/bin/zsh # /usr/bin/gnome-terminal # /usr/bin/firefox # chromium-browser

	# -v $HOME/.config/app:/root/.config/app \
	# --cap-add=SYS_ADMIN \ ### this gets chrome and firefox working
	# --privileged  ### have the same effect, chrome, firefox can run now.

# docker run -it \
#     --user=$USER \
#     --env="DISPLAY" \
#     --workdir="/home/$USER" \
#     --volume="/home/nhan2/Projects/docker/dev/home:/home" \
#     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
#     dev /usr/bin/firefox
