FROM continuumio/miniconda3

RUN apt-get update --yes && apt-get install --yes tmux vim less

COPY environment /opt/build/environment/
COPY script /opt/build/script/
COPY modulefiles /opt/build/modulefiles

WORKDIR /opt/build/script

RUN sed -i 's/^_INSTALL_DIR=.*/_INSTALL_DIR=\/opt\/ufs-conda/' env.sh
RUN sed -i 's/^_CONDA_BIN=.*/_CONDA_BIN=conda/' env.sh

#RUN bash install-conda-env.sh
RUN bash install-conda-env-land-da-wflow.sh
RUN bash install-modulefiles.sh
