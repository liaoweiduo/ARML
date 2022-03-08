#!/usr/bin/env bash

export GPU_ID=$1

echo GPU_ID:$GPU_ID

cd ..

export CUDA_VISIBLE_DEVICES=$GPU_ID

#python main.py --datasource=BA --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01

# Bird
python main.py --datasource=meta-dataset/CUB_Bird --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000

# Aircraft
#python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=2 --train=False --test_epoch=49000

# Texture
#python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=1 --train=False --test_epoch=49000

# Fungi
#python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=3 --train=False --test_epoch=49000

# mini-imagenet
#python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=3 --train=False --test_epoch=49000

# Flower
#python main.py --datasource=VGG_Flower --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# Aircraft results:
# [0.19879836, 0.49719983, 0.5497996 , 0.56519926, 0.5703992 ,
#  0.5717993 , 0.5731993 , 0.5743994 , 0.57379943, 0.57419944,
#  0.5735994 , 0.57359946, 0.57359946, 0.5735994 , 0.57379943,
#  0.5739994 , 0.5737993 , 0.5735993 , 0.5745993 , 0.57499933,
#  0.57579935]

# DTD_Texture results:
# [0.21039885, 0.30679953, 0.3109995 , 0.3151995 , 0.31499955,
#  0.3147995 , 0.31419957, 0.31499955, 0.31479955, 0.31419954,
#  0.31439954, 0.3145995 , 0.3151995 , 0.3155995 , 0.3157995 ,
#  0.3155995 , 0.31619948, 0.31639948, 0.3157995 , 0.3153995 ,
#  0.31499952]


# Fungi results:
# [0.19719902, 0.33279973, 0.33259976, 0.33279976, 0.33259982,
#  0.33259982, 0.33279982, 0.33279982, 0.3327998 , 0.3327998 ,
#  0.3321998 , 0.3327998 , 0.33279982, 0.3327998 , 0.3323998 ,
#  0.33219978, 0.33259976, 0.33259976, 0.33219975, 0.33199975,
#  0.33199975]


# mini-imagenet results:
# [0.19959894, 0.34339982, 0.34439993, 0.34599987, 0.34619987,
#  0.3461999 , 0.3461999 , 0.34659994, 0.34679997, 0.34719998,
#  0.34679997, 0.34719998, 0.3476    , 0.34800002, 0.34840006,
#  0.34820005, 0.34780002, 0.3484    , 0.3484    , 0.3484    ,
#  0.3482    ]




# import numpy as np
#
# acc = np.array([0.34339982, 0.34439993, 0.34599987, 0.34619987,
#  0.3461999 , 0.3461999 , 0.34659994, 0.34679997, 0.34719998,
#  0.34679997, 0.34719998, 0.3476    , 0.34800002, 0.34840006,
#  0.34820005, 0.34780002, 0.3484    , 0.3484    , 0.3484    ,
#  0.3482    ])
# mean = np.mean(acc)
# std = np.std(acc)