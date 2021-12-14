FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
# FROM nvidia/cuda:11.4.2-cudnn8-devel-ubuntu20.04
# FROM nvidia/cuda:11.2.2-cudnn8-runtime-ubuntu20.04
# ENV DEBIAN_FRONTEND=nonintercative
ARG DEBIAN_FRONTEND=noninteractive # for ubuntu 20.04


RUN apt-get update  -y \
  && apt-get install -y git cmake make gnupg build-essential software-properties-common gdb unzip\
  && add-apt-repository ppa:deadsnakes/ppa \
  && apt update -y && apt-get install -y python3.7-dev \
  && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1 \
  && apt-get install -y python3-pip ffmpeg libsm6 libxext6 \
  && pip3 install --upgrade pip


RUN git clone https://github.com/luisCossio/fruit_detection_yolov4.git && mkdir -p fruit_detection_yolov4/weights \
  && mkdir datasets && mkdir datasets/wider && pip3 install Cython==0.29.23 numpy==1.20.1

RUN  cd /fruit_detection_yolov4 && pip3 install -r requirements.txt


WORKDIR /fruit_detection_yolov4