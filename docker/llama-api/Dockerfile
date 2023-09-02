FROM ubuntu:23.10 as builder

SHELL ["/bin/bash", "--login", "-c"]

RUN apt-get update && apt-get install -y wget

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/mininconda.sh && \
    sh /tmp/mininconda.sh -b -p /miniconda3

ENV PATH=/miniconda3/bin:$PATH
ARG PATH=/miniconda3/bin:$PATH

RUN conda init bash

RUN conda install -n base conda-libmamba-solver && \
    conda config --set solver libmamba

RUN conda create -n llama python=3.11

RUN conda install -n llama pytorch pytorch-cuda=11.7 -c pytorch -c nvidia

RUN source /miniconda3/etc/profile.d/conda.sh && \
    conda activate llama && \
    pip install flask

RUN source /miniconda3/etc/profile.d/conda.sh && \
    conda activate llama && \
    git clone https://github.com/facebookresearch/llama.git && \
    cd llama && \
    pip install -e .

FROM ubuntu:23.10

COPY --from=builder /miniconda3 /miniconda3

ADD ./llama-api /llama-api
ADD ./docker/llama-api/entrypoint.sh /entrypoint.sh 

ENTRYPOINT ["/entrypoint.sh"]