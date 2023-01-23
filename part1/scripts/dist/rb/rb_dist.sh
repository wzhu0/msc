NE=$1
NUM_GENES=$2

r_command="REP = 50;
            SP_DIR = \"/home/wzhu/irt/sim/data/sptree/\";
            REV_DIR = \"/home/wzhu/irt/part1/data/sptree/rb/ne_${NE}_gene_${NUM_GENES}/\";
            source(\"./revbayes_RFdistance.R\");"
echo $r_command | R --no-save >> ~/irt/part1/stats/ne_${NE}_gene_${NUM_GENES}/rb_dist.txt
