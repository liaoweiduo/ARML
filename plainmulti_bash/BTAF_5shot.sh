#!/usr/bin/env bash

export GPU_ID=$1

echo GPU_ID:$GPU_ID

cd ..

export CUDA_VISIBLE_DEVICES=$GPU_ID

python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=48 --hidden_dim=128 --emb_loss_weight=0.01

# Bird
python main.py --datasource=meta-dataset/CUB_Bird --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49999
python main.py --datasource=meta-dataset/CUB_Bird --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49999
python main.py --datasource=meta-dataset/CUB_Bird --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49999


# Aircraft
python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=2 --train=False --test_epoch=49000
python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=2 --train=False --test_epoch=49000
python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=2 --train=False --test_epoch=49000


# Texture
python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=1 --train=False --test_epoch=49000
python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=1 --train=False --test_epoch=49000
python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=1 --train=False --test_epoch=49000


# Fungi
python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=3 --train=False --test_epoch=49000
python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=3 --train=False --test_epoch=49000
python main.py --datasource=plainmulti --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=3 --train=False --test_epoch=49000


# mini-imagenet
python main.py --datasource=mini_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=mini_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=mini_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# traffic sign
python main.py --datasource=traffic_sign_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=traffic_sign_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=traffic_sign_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# Flower
python main.py --datasource=VGG_Flower_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=VGG_Flower_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=VGG_Flower_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# Omniglot
python main.py --datasource=Omniglot_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=Omniglot_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=Omniglot_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# MSCOCO
python main.py --datasource=mscoco_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=mscoco_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=mscoco_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# Clipart
python main.py --datasource=DomainNet/clipart_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=DomainNet/clipart_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=DomainNet/clipart_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# Infograph
python main.py --datasource=DomainNet/infograph_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=DomainNet/infograph_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=DomainNet/infograph_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# Painting
python main.py --datasource=DomainNet/painting_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=DomainNet/painting_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=DomainNet/painting_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# Quickdraw
python main.py --datasource=DomainNet/quickdraw_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=DomainNet/quickdraw_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=DomainNet/quickdraw_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# Real
python main.py --datasource=DomainNet/real_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=DomainNet/real_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=DomainNet/real_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# Sketch
python main.py --datasource=DomainNet/sketch_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=DomainNet/sketch_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=DomainNet/sketch_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# CIFAR-10
python main.py --datasource=CIFAR10_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=CIFAR10_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=CIFAR10_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# CIFAR-100
python main.py --datasource=CIFAR100_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=CIFAR100_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=CIFAR100_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# Cars
python main.py --datasource=cars_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=cars_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=cars_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# Pets
python main.py --datasource=pets_head_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=pets_head_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=pets_head_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000


# Dogs
python main.py --datasource=dogs_84 --datadir=/liaoweiduo/datasets --test_seed=1 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=dogs_84 --datadir=/liaoweiduo/datasets --test_seed=2 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
python main.py --datasource=dogs_84 --datadir=/liaoweiduo/datasets --test_seed=3 --metatrain_iterations=40000 --meta_batch_size=4 --update_batch_size=5 --update_lr=0.01 --num_updates=5 --num_classes=5 --logdir=/liaoweiduo/ARML/logs --num_filters=32 --hidden_dim=128 --emb_loss_weight=0.01 --test_dataset=0 --train=False --test_epoch=49000
