NE=$1
NUM_GENES=$2

r_command="REP = 50;
           SP_DIR = \"/home/wzhu/irt/sim/data/sptree/\";
	   MP_DIR = \"/home/wzhu/irt/part1/data/sptree/mp/ne_${NE}_gene_${NUM_GENES}/\";
	   source(\"./mp_RFdistance.R\");"
echo $r_command | R --no-save >> ~/irt/part1/stats/ne_${NE}_gene_${NUM_GENES}/mp_dist.txt
