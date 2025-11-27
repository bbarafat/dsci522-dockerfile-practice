FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# copy the lockfile into the container
COPY conda-linux-64.lock conda-linux-64.lock

RUN conda update --quiet --file conda-linux-64.lock \
  && fix-permissions "${CONDA_DIR}" \
  && fix-permissions "/home/${NB_USER}"