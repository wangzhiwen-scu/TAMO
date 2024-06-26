

#! usr/bin/env bash

# todo anatomy: knee pd ->brain t2


args=(
    --shift "anatomy"
    --pretrain_dataset "fastmri_knee_pd"
    --supervised_dataset_name "fastmri_brain_t2"
    # --supervised_dataset_name "fastmri_knee_pdfs"
    # --supervised_dataset_name "fastmri_brain_t1"
    # --supervised_dataset_name "fastmri_brain_t2"
    --epochs 10 
    --lr 5e-4
    --batch_size 1
    )
device=0


# todo our
# python ./training/mri_py/our_s1_train.py "${args[@]}"  --lr 1e-3 # loss stop ❤

# todo md-recon
# python ./training/mri_py/main_mdrecon.py "${args[@]}"  --lr 1e-3 --epochs 15  # loss stop ❤

# todo TTT
# python ./training/mri_py/main_ttt_train.py "${args[@]}"  --lr 1e-3 --epochs 20 # loss stop ❤

python ./training/mri_py/main_metainvnet.py "${args[@]}"  --lr 1e-3 --epochs 20 # loss stop ❤


# TTA for noise
args=(
    --shift "anatomy"
    --pretrain_dataset "fastmri_knee_pd"
    --supervised_dataset_name "fastmri_brain_t2"

    --epochs 10 
    --lr 1e-4
    --batch_size 1
    )
device=0

# todo our
# python ./training/mri_py/our_s2_tta.py "${args[@]}" --lr 1e-5 # loss stop ❤

# todo ei
# python ./training/mri_py/main_ei_tta.py "${args[@]}" --lr 5e-4 --epochs 20 # loss stop ❤

# todo TTT
# python ./training/mri_py/main_ttt_tta.py "${args[@]}" --lr 1e-4 # loss stop ❤

