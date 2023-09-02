#!/bin/bash --login

cd /llama-api
source /miniconda3/etc/profile.d/conda.sh
conda activate wrd
python flast app.py