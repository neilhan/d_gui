FROM docker.io/fedora
MAINTAINER http://fedoraproject.org/wiki/Cloud

# RUN label is for atomic cli, allows for ease of use
LABEL RUN='docker run -d -p 5901:5901 -v /etc/machine-id:/etc/machine-id:ro $IMAGE'

# Install the appropriate software
RUN dnf -y update 
RUN dnf -y groupinstall gnome-desktop
RUN dnf -y install tmux git vim gvim maven util-linux-user zsh rsync

RUN dnf -y install firefox
RUN dnf -y install chromium

RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
RUN sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# RUN dnf -y tigervnc-server

# Please replace nhan2 with your User and Group
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/nhan2 && \
    echo "nhan2:x:${uid}:${gid}:nhan2,,,:/home/nhan2:/usr/bin/zsh" >> /etc/passwd && \
    echo "nhan2:x:${uid}:" >> /etc/group && \
    usermod nhan2 -a -G wheel  && \
    chown ${uid}:${gid} -R /home/nhan2

    # echo "nhan2 ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nhan2 && \
    # chmod 0440 /etc/sudoers.d/nhan2 && \

USER nhan2
ENV HOME /home/nhan2
CMD /usr/bin/zsh
# CMD    ["vncserver", "-fg" ]
# ENTRYPOINT ["vncserver", "-fg" ]
