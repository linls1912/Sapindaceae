####Batch file to run 2-scrubreads


#!/bin/bash -l
#SBATCH --job-name=clean
#SBATCH --partition=vector
#SBATCH --qos=vector_batch
#SBATCH --mail-user=chery.joyce@berkeley.edu
#SBATCH --mail-type=ALL
#SBATCH --mem-per-cpu=12G
#SBATCH --time=299:99:00 


cd /clusterfs/vector/scratch/cdspecht/Joyce_Chery

source /usr/Modules/init/bash

module load jdk/1.7.0_75
module load beagle
module load samtools
module load python
module load bedtools
module load cutadapt
module load flash
module load bowtie/2.2.3

2-ScrubReads -i A80 -f /clusterfs/vector/scratch/cdspecht/Joyce_Chery/Data -o /clusterfs/vector/scratch/cdspec
ht/clean/ -a /clusterfs/vector/scratch/cdspecht/adapters.fa -b /clusterfs/vector/scratch/cdspecht/Joyce_Chery/
Programs/library.txt -t /global/home/users/cdspecht/bin/trimmomatic-0.30.jar -c /clusterfs/vector/scratch/cdsp
echt/contaminants.fa -e 250


exit
