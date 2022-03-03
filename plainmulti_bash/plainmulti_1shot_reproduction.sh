#!/usr/bin/env bash

export GPU_ID=$1

echo GPU_ID:$GPU_ID

cd ..

export CUDA_VISIBLE_DEVICES=$GPU_ID

python main.py --datasource=plainmulti --datadir=/liaoweiduo/ARML --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01
python main.py --datasource=plainmulti --datadir=/liaoweiduo/ARML --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=plainmulti --train=False --test_epoch=49