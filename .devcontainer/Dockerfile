ARG VARIANT="3.10-bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/python:0-${VARIANT}

ENV TFENV_VERSION 1.3.1
ENV INSTALL_DIR /installs

# nvm -----------------------------------------------------------------------------

ARG NODE_VERSION="lts/*"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c ". /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# intsalls ------------------------------------------------------------------------

RUN apt update && apt -y install gcc musl-dev acl

# go-task -------------------------------------------------------------------------

RUN bash -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b $INSTALL_DIR
RUN ln -sf $INSTALL_DIR/task /usr/bin/task

# pip installs -------------------------------------------------------------------

COPY ./requirements.txt /usr/
RUN pip install --no-cache --upgrade pip setuptools
RUN pip install -r /usr/requirements.txt

# init ---------------------------------------------------------------------------
RUN echo "task init" | tee -a /home/vscode/.bashrc >> /home/vscode/.zshrc
