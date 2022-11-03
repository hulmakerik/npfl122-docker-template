ARG VERSION="22.09"
ARG USER_UID=1003       # CHANGE TO MATCH YOUR HOST UID!!!
ARG USER_GID=$USER_UID

# image contents, package versions etc:
# https://docs.nvidia.com/deeplearning/frameworks/pytorch-release-notes/rel-22-10.html#rel-22-10
FROM nvcr.io/nvidia/pytorch:${VERSION}-py3
ENV DEBIAN_FRONTEND=noninteractive

# Packages
RUN apt-get update
RUN apt-get install software-properties-common -y
COPY pkglist.txt pkglist.txt
RUN xargs apt-get install -y < pkglist.txt


# Create the user
ARG USERNAME=user
RUN groupadd --gid $USER_GID $USERNAME
RUN useradd --uid $USER_UID --gid $USER_GID -m $USERNAME
RUN apt-get install -y sudo
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
RUN chmod 0440 /etc/sudoers.d/$USERNAME


# Python env
COPY requirements.txt requirements.txt
RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt
RUN conda clean --all

USER $USERNAME
WORKDIR /home/$USERNAME
COPY .bashrc .bashrc

# CMD ["/bin/bash"]
