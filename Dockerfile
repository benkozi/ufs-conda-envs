FROM continuumio/miniconda3

RUN apt-get update --yes && apt-get install --yes tmux vim less

COPY environment /opt/build/environment/
COPY script /opt/build/script/
COPY modulefiles /opt/build/modulefiles

WORKDIR /opt/build/script

ENV UCE_CONDA_ENV=default
ENV UCE_PLATFORM=docker
RUN bash install-env.sh

ENV UCE_CONDA_ENV=land-da-wflow
ENV UCE_PLATFORM=docker
RUN bash install-env.sh
