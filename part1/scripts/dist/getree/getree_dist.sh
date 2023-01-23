NE=$1
NUM_GENES=$2

r_command="REP = 50;
	   NUM_GENES=${NUM_GENES};
           SP_DIR = \"/home/wzhu/irt/sim/data/sptree/\";
	   GE_DIR = \"/home/wzhu/irt/sim/data/getree/ne_${NE}_gene_${NUM_GENES}/\";
	   source(\"./gene_trees_RFdistance.R\");"
echo $r_command | R --no-save >> ~/irt/part1/stats/ne_${NE}_gene_${NUM_GENES}/variation.txt
