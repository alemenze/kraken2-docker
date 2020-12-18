FROM continuumio/miniconda3:4.9.2
LABEL authors="Alex Lemenze" \
    description="Docker image for Kraken2/Bracken set up"

COPY environment.yml /
RUN apt-get update \
 && apt-get install -y procps \
 && apt-get clean -y && rm -rf /var/lib/apt/lists/*
RUN conda env create -f /environment.yml && conda clean --all
ENV PATH /opt/conda/envs/kraken2-docker/bin:$PATH