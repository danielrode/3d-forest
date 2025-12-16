# author: Daniel Rode
# dependencies:
#   podman 5.7.0
# created: 16 Dec 2025


# Container build spec for 3D Forest where interface can be accessed via VNC


FROM docker.io/ubuntu:24.04

# Install build dependencies
RUN <<EOF
set -e
apt update
apt upgrade -y
env DEBIAN_FRONTEND=noninteractive TZ=America/New_York apt install -y \
  build-essential \
  cmake \
  git \
  libgl1-mesa-dev \
  libxcb-cursor0 \
  libxcb-cursor-dev \
  libxcb-xinerama0 \
  libxkbcommon-dev \
  libxkbfile-dev \
  mesa-common-dev \
  qt6-base-dev \
;
EOF

# Build and install 3D Forest
RUN <<EOF
set -e
cd /root
git clone https://github.com/VUKOZ-OEL/3d-forest.git
cd 3d-forest
mkdir build
cd build
cmake -G "Unix Makefiles" .. -DCMAKE_INSTALL_PREFIX=/usr/local \
  -DOpenGL_GL_PREFERENCE=GLVND -DCMAKE_INSTALL_RPATH="/usr/local/bin" \
  -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE \
;
make
make install
EOF

# Install window manager (for interacting via VNC)
RUN <<EOF
set -e  # Exit on error
apt-get install -y \
  openbox \
  x11vnc \
  xterm \
  xvfb \
;
EOF

# Install 3D Forest interface init script and expose VNC port
COPY assets/start-3d-forest-interface /bin/
EXPOSE 5900/tcp
