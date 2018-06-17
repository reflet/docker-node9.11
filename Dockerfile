FROM node:9.11

ARG USER="node"
ARG UID="1000"
ARG GROUP="node"
ARG GID="1000"
ARG DOCUMENT_DIR="/var/www/"
ARG WORKSPACE="/home/node/"

# document directory.
RUN mkdir $DOCUMENT_DIR -p

# set workspace.
RUN mkdir $WORKSPACE -p
WORKDIR $WORKSPACE

# set node user.
RUN groupmod -g $GID $GROUP && usermod -u $UID -g $GID $USER
RUN chown -R $UID:$GID $DOCUMENT_DIR
RUN chown -R $UID:$GID $WORKSPACE
USER $USER

