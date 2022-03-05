#!/usr/bin/env bash

export GPU_ID=$1

echo GPU_ID:$GPU_ID

cd ..

export CUDA_VISIBLE_DEVICES=$GPU_ID

#python main.py --datasource=BA --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01
python main.py --datasource=CUB_Bird --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# DTD_Texture results:
# [0.21039885, 0.30679953, 0.3109995 , 0.3151995 , 0.31499955,
#  0.3147995 , 0.31419957, 0.31499955, 0.31479955, 0.31419954,
#  0.31439954, 0.3145995 , 0.3151995 , 0.3155995 , 0.3157995 ,
#  0.3155995 , 0.31619948, 0.31639948, 0.3157995 , 0.3153995 ,
#  0.31499952]