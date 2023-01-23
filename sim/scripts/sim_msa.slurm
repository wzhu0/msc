#!/bin/bash 
#SBATCH --job-name=sim_msa
#SBATCH --output=/home/wzhu/irt/sim/logs/msa/sim_%j.log
#SBATCH --error=/home/wzhu/irt/sim/logs/msa/sim_%j.err
#SBATCH --ntasks=1
#SBATCH --ntasks-per-core=1
#SBATCH --mem-per-cpu=1G
#SBATCH --time=24:00:00
#SBATCH --mail-user wenjie.zhu@campus.lmu.de
#SBATCH --mail-type=ALL
#SBATCH --qos=high_prio

# load modules
module load gnu/7
module load boost
module load openmpi

# variables
NE=$1
NUM_GENES=$2
DIR="/home/wzhu/irt/"


# run revbayes to simulate sequence data
rb_command="NE = ${NE};
            NUM_GENES = ${NUM_GENES};
            GETREE_DIR = \"${DIR}/sim/data/getree/ne_${NE}_gene_${NUM_GENES}/\";
            OUT_DIR = \"${DIR}/sim/data/msa/ne_${NE}_gene_${NUM_GENES}/\";
            source(\"${DIR}/sim/scripts/sim_msa.Rev\");"
echo $rb_command | rb-msc
