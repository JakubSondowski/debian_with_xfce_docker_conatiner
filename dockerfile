FROM debian

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
apt upgrade -y && \
apt autoremove -y

RUN apt install -y dbus dbus-x11

RUN apt install -y \
    sudo \
    wget \
    curl \
    git \
    build-essential \
    pkg-config \
    cmake \
    make \
    xfce4 \
    xfce4-goodies \
    tigervnc-standalone-server \
    novnc \
    websockify \
    lynx
    
    RUN useradd -m -s /bin/bash user && \
    echo "user:password2137" | chpasswd && \
    usermod -aG sudo user
    
    WORKDIR /workspace
    
    RUN chown -R user:user /workspace
    
    USER user
    
    RUN mkdir -p /home/user/.vnc && \
    mkdir -p /home/user/.config/tigervnc && \
    echo '#!/bin/bash\nstartxfce4 &' > /home/user/.vnc/xstartup && \
    chmod +x /home/user/.vnc/xstartup
    
    EXPOSE 2137
    
    CMD ["bash", "-c", "\
    export DBUS_SESSION_BUS_ADDRESS=unix:path=/tmp/dbus.sock && \
    dbus-daemon --session --fork --address=unix:path=/tmp/dbus.sock && \
    vncserver :1 -geometry 1920x1080 -SecurityTypes None && \
    websockify --web=/usr/share/novnc 2137 localhost:5901"]