#PBS -N post-kraken
#PBS -l nodes=1:ppn=20,vmem=250gb,walltime=600:00:00
#PBS -V
#PBS -q ensam

module load kraken/0.10.6
cd $PBS_O_WORKDIR

kraken-translate  --db $mainDB /data/software/kraken/KRAKEN/ results.kraken > results.labels
kraken-report --db $mainDB /data/software/kraken/KRAKEN/ results.kraken > results.report
kraken-filter --db $mainDB /data/software/kraken/KRAKEN/ 0.05 results.kraken > results.filter
