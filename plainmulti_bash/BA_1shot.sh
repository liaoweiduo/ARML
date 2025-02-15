#!/usr/bin/env bash

export GPU_ID=$1

echo GPU_ID:$GPU_ID

cd ..

export CUDA_VISIBLE_DEVICES=$GPU_ID

python main.py --datasource=BA --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01

# Bird
#python main.py --datasource=meta-dataset/CUB_Bird --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000

# Aircraft
#python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=2 --train=False --test_epoch=49000

# Texture
#python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=1 --train=False --test_epoch=49000

# Fungi
#python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=3 --train=False --test_epoch=49000

# mini-imagenet
#python main.py --datasource=mini_imagenet_full_size --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000

# traffic sign
#python main.py --datasource=traffic_sign_84 --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000

# Flower
#python main.py --datasource=VGG_Flower_84 --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000

# Omniglot
#python main.py --datasource=Omniglot_84 --datadir=/liaoweiduo/datasets --metatrain_iterations=50000 --meta_batch_size=4 --update_batch_size=1 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/BA --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000

# Bird results:
# [0.1989989 , 0.6215989 , 0.6217989 , 0.6225989 , 0.6225989 ,
#  0.62319887, 0.62239885, 0.622599  , 0.623599  , 0.623399  ,
#  0.623399  , 0.623399  , 0.62359905, 0.62359905, 0.623399  ,
#  0.62279916, 0.6231991 , 0.62339914, 0.62339914, 0.62359905,
#  0.62339914]

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


# traffic sign results:
# [0.20759885, 0.4198    , 0.42219982, 0.43099988, 0.43019977,
#  0.42999983, 0.43179983, 0.43279982, 0.43399978, 0.43159983,
#  0.43439984, 0.43279985, 0.4337998 , 0.43319982, 0.43459988,
#  0.43279988, 0.43379983, 0.4331998 , 0.43299985, 0.43259978,
#  0.4323998 ]

# flower results:
# [0.19199902, 0.65039814, 0.6511982 , 0.65199816, 0.6525982 ,
#  0.65239817, 0.6517982 , 0.6517983 , 0.65199834, 0.65199834,
#  0.6521983 , 0.6525982 , 0.6529982 , 0.6525982 , 0.6523982 ,
#  0.65259826, 0.65279824, 0.65279824, 0.6525982 , 0.6525982 ,
#  0.6525982 ]

# Omniglot results:
# [0.19299868, 0.4404    , 0.4816    , 0.5457999 , 0.5997994 ,
#  0.61079925, 0.6175991 , 0.6169991 , 0.61779904, 0.61799926,
#  0.61859924, 0.61939925, 0.61899906, 0.6195991 , 0.61919916,
#  0.6191992 , 0.6199992 , 0.61919916, 0.6205992 , 0.6207992 ,
#  0.62019914]



# import numpy as np
#
# acc = np.array([0.34339982, 0.34439993, 0.34599987, 0.34619987,
#  0.3461999 , 0.3461999 , 0.34659994, 0.34679997, 0.34719998,
#  0.34679997, 0.34719998, 0.3476    , 0.34800002, 0.34840006,
#  0.34820005, 0.34780002, 0.3484    , 0.3484    , 0.3484    ,
#  0.3482    ])
# mean = np.mean(acc)
# std = np.std(acc)