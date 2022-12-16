#!/usr/bin/env bash

CONFIG=$1
GPUS=$2
ENV_NAME=$3
CUDA_VISIBLE_DEVICES=$4
PORT=${PORT:-29500}
eval "$(conda shell.bash hook)"
conda activate $ENV_NAME

PYTHONPATH="$(dirname $0)/..":$PYTHONPATH \

CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES python -m torch.distributed.launch --nproc_per_node=$GPUS --master_port=$PORT \
    $(dirname "$0")/train.py $CONFIG --launcher pytorch ${@:5}
