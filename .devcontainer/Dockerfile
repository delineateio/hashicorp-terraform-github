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

# tfenv --------------------------------------------------------------------------

RUN mkdir -p $INSTALL_DIR
RUN git clone --depth=1 https://github.com/tfutils/tfenv.git $INSTALL_DIR/tfenv
RUN setfacl -R -m u:vscode:rwx $INSTALL_DIR/tfenv
RUN ln -s $INSTALL_DIR/tfenv/bin/* /usr/bin
RUN tfenv install $TFENV_VERSION
RUN tfenv use $TFENV_VERSION

# init ---------------------------------------------------------------------------

RUN echo "source /home/vscode/.devcontainer.env" | tee -a /home/vscode/.bashrc >> /home/vscode/.zshrc
RUN echo "task init" | tee -a /home/vscode/.bashrc >> /home/vscode/.zshrc
