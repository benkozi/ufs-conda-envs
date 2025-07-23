FROM continuumio/miniconda3

RUN apt-get update --yes && apt-get install --yes tmux vim less lmod
RUN . /usr/share/lmod/lmod/init/bash && module --version

COPY environment.yaml /opt/build/environment.yaml
RUN conda env create -f /opt/build/environment.yaml

COPY environment /opt/build/environment/
COPY script /opt/build/script/
COPY modulefiles /opt/build/modulefiles

WORKDIR /opt/build/script

ENV UCE_CONDA_ENV=default
ENV UCE_PLATFORM=docker
RUN bash install-env.sh

RUN . /usr/share/lmod/lmod/init/bash && \
      module use /opt/ufs-conda/modulefiles && \ #tdk: need modulefiles in docker to account for path
      module load python-ufs-default && \
      which python && \
      python --version

ENV UCE_CONDA_ENV=land-da-wflow
ENV UCE_PLATFORM=docker
RUN bash install-env.sh

RUN . /usr/share/lmod/lmod/init/bash && \
      module use /opt/ufs-conda/modulefiles && \
      module load python-ufs-land-da-wflow && \
      which python && \
      python --version
