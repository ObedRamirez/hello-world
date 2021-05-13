####
#PBS -N help
#PBS -l nodes=1:ppn=30,vmem=250gb,walltime=600:00:00
#PBS -V
#PBS -q ensam

module load kraken/0.10.6
cd $PBS_O_WORKDIR

kraken --db $mainDB /data/software/kraken/KRAKEN/ --threads 30 /LUSTRE/usuario/oramirez/KRAKEN/inchworm.K31.L31.DS.ordered.fa > /LUSTRE/usuario/oramirez/KRAKEN/results.kraken
