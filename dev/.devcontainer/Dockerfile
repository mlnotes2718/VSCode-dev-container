# Start from Ubuntu base
FROM ubuntu:24.04

# Avoid tzdata interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install wget, bash, and other utilities
RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    git \
    curl \
    ca-certificates \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
ARG USERNAME=devuser
ARG USER_UID=1001
ARG USER_GID=1001

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set environment variables for conda
ENV PATH=/opt/conda/bin:$PATH

# Install Miniconda (latest installer)
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p /opt/conda && \
    rm /tmp/miniconda.sh && \
    /opt/conda/bin/conda clean -afy

# Initialize conda for bash (do this as root first)
RUN /opt/conda/bin/conda init bash

# Copy the conda initialization to devuser's bashrc
RUN cp /root/.bashrc /home/devuser/.bashrc

# Give the user ownership of conda and home directory
RUN chown -R devuser:devuser /opt/conda /home/devuser

# Switch to non-root user
USER devuser

# Default working directory
WORKDIR /home/devuser/workspace