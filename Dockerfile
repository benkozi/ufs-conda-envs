FROM continuumio/miniconda3

RUN apt-get update --yes && apt-get install --yes tmux vim less lmod
RUN . /usr/share/lmod/lmod/init/bash && module --version

COPY environment.yaml /opt/build/environment.yaml
RUN conda env create -f /opt/build/environment.yaml

COPY ufs_conda.py /opt/build
COPY template /opt/build/template/
COPY environment /opt/build/environment/

WORKDIR /opt/build

#ENV UCE_CONDA_ENV=default
#ENV UCE_PLATFORM=docker
#RUN bash install-env.sh

RUN conda run -n ufs-conda-envs --no-capture-output python ufs_conda.py create --env-key default --platform docker

COPY ./script /opt/build/script/

RUN conda run -n ufs-conda-envs --no-capture-output pytest script/test_env.py

#RUN . /usr/share/lmod/lmod/init/bash && \
#      module use /opt/conda/modulefiles && \
#      module load python-ufs-default && \
#      which python



#ENV UCE_CONDA_ENV=land-da-wflow
#ENV UCE_PLATFORM=docker
#RUN bash install-env.sh
#
#RUN . /usr/share/lmod/lmod/init/bash && \
#      module use /opt/ufs-conda/modulefiles && \
#      module load python-ufs-land-da-wflow && \
#      which python && \
#      python --version
