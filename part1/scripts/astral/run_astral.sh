NE=$1
NUM_GENES=$2

for i in {1..50}
do
    java -jar ~/app/ASTRAL/Astral/astral.5.7.8.jar -i ~/irt/sim/data/getree/ne_${NE}_gene_${NUM_GENES}/sim_${i}.tree -o ~/irt/part1/data/sptree/astral/ne_${NE}_gene_${NUM_GENES}/astral_${i}.tree 2> ~/irt/part1/logs/astral/ne_${NE}_gene_${NUM_GENES}/astral_${i}.log
done

