#!/usr/bin/env bash

export GPU_ID=$1

echo GPU_ID:$GPU_ID

cd ..

export CUDA_VISIBLE_DEVICES=$GPU_ID

#python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01

# Bird
python main.py --datasource=meta-dataset/CUB_Bird --datadir=/liaoweiduo/datasets --test_seed=0 --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=meta-dataset/CUB_Bird --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000

# result:
# [0.5775992, 0.5983991, 0.5829997, 0.5767996]

# Aircraft
#python test.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=2 --train=False --test_epoch=49000

# Texture
#python test.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=1 --train=False --test_epoch=49000

# Fungi
#python test.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=3 --train=False --test_epoch=49000

# mini-imagenet
#python test.py --datasource=mini_imagenet_full_size --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000

# traffic sign
#python test.py --datasource=traffic_sign_84 --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000

# Flower
#python test.py --datasource=VGG_Flower_84 --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000

# Omniglot
#python test.py --datasource=Omniglot_84 --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000






# import numpy as np
#
# acc = np.array([0.34339982, 0.34439993, 0.34599987, 0.34619987,
#  0.3461999 , 0.3461999 , 0.34659994, 0.34679997, 0.34719998,
#  0.34679997, 0.34719998, 0.3476    , 0.34800002, 0.34840006,
#  0.34820005, 0.34780002, 0.3484    , 0.3484    , 0.3484    ,
#  0.3482    ])
# mean = np.mean(acc)
# std = np.std(acc)