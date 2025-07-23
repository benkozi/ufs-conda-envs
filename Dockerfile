FROM ubuntu

RUN apt-get update --yes && apt-get install --yes tmux vim less lmod wget
RUN . /usr/share/lmod/lmod/init/bash && module --version

COPY ./template /opt/build/template
COPY ./environment /opt/build/environment
COPY ufs_conda.py /opt/build
COPY init.sh /opt/build
COPY environment.yaml /opt/build

WORKDIR /opt/build

RUN bash init.sh

RUN conda run -n ufs-conda-envs --no-capture-output python ufs_conda.py create --env-key default --platform docker

RUN . /usr/share/lmod/lmod/init/bash && \
      module use /opt/ufs-conda/modulefiles && \
      module load python-ufs-default && \
      which python && \
      python --version
