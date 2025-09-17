FROM continuumio/miniconda3

RUN apt-get update --yes && apt-get install --yes tmux vim less lmod
RUN . /usr/share/lmod/lmod/init/bash && module --version

COPY environment.yaml /opt/build/environment.yaml
RUN conda env create -f /opt/build/environment.yaml

COPY src/ufs_conda /opt/build/src/ufs_conda/
COPY pyproject.toml /opt/build
COPY template /opt/build/template/
COPY environment /opt/build/environment/

WORKDIR /opt/build

RUN conda run -n ufs-conda-envs --no-capture-output pip install .

#RUN conda run -n ufs-conda-envs --no-capture-output ufs-conda create --env-key=default --platform=docker
#RUN conda run -n ufs-conda-envs --no-capture-output ufs-conda create --env-key=land-da-wflow --platform=docker #tdk:uncomm
RUN conda run -n ufs-conda-envs --no-capture-output ufs-conda create --env-key=mpas-aerosols --platform=docker

COPY src/test /opt/build/src/test/
RUN #conda run -n ufs-conda-envs --no-capture-output pytest src/test/docker_env_verify.py

WORKDIR /opt
RUN rm -rf /opt/build

RUN echo "conda activate ufs-conda-envs" >> ~/.bashrc
