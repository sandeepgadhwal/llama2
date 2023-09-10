FROM ubuntu:23.10 as builder

RUN apt update && apt install make git git-lfs -y

RUN git lfs install

RUN git clone https://sandeepgadhwal:${HF_TOKEN}@huggingface.co/meta-llama/Llama-2-7b
# RUN git clone https://github.com/facebookresearch/llama.git

# WORKDIR llama

# ADD ./model_config.txt .
# RUN ./download.sh < model_config.txt

# RUN git clone https://github.com/ggerganov/llama.cpp

# WORKDIR llama.cpp

# RUN make