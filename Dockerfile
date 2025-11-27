FROM --platform=linux/amd64 quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY --chown=${NB_UID}:${NB_GID} conda-linux-64.lock /tmp/conda-linux-64.lock

RUN mamba install -c conda-forge conda-lock \
    && conda-lock install --name base /tmp/conda-linux-64.lock \
    && mamba clean --all -y -f \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"
