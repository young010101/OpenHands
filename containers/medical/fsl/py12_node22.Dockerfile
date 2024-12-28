FROM nikolaik/python-nodejs:python3.12-nodejs22

ENV FSLDIR="/usr/local/fsl"
ENV DEBIAN_FRONTEND="noninteractive"
ENV LANG="en_GB.UTF-8"

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    python-is-python3 \
    wget \
    file \
    dc \
    mesa-utils \
    pulseaudio \
    libquadmath0 \
    libgtk2.0-0 \
    firefox-esr \
    libgomp1

RUN wget https://fsl.fmrib.ox.ac.uk/fsldownloads/fslconda/releases/fslinstaller.py && \
    python ./fslinstaller.py -d /usr/local/fsl/

RUN echo '. /usr/local/fsl/etc/fslconf/fsl.sh' >> /etc/bash.rc
