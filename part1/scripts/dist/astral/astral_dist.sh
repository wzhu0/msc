NE=$1
NUM_GENES=$2

r_command="REP = 50;
            SP_DIR = \"/home/wzhu/irt/sim/data/sptree/\";
            AS_DIR = \"/home/wzhu/irt/part1/data/sptree/astral/ne_${NE}_gene_${NUM_GENES}/\";
            source(\"./astral_RFdistance.R\");"
echo $r_command | R --no-save >> ~/irt/part1/stats/ne_${NE}_gene_${NUM_GENES}/astral_dist.txt
