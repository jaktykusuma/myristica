#!/bin/bash

###### Configuration SLURM#################################
## Name of the job: secapr_arg_loci50
#SBATCH --job-name=secapr_arg_loci50
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=12
#SBATCH --mail-user=jakty.kusuma@ird.fr
#SBATCH --mail-type=ALL
#SBATCH -p highmem
############################################################

echo "JOB CONFIGURATION"
echo "Job ID: " $SLURM_JOB_ID
echo "Name of the job: " $SLURM_JOB_NAME		
echo "List of nodes allocated to the job: " $SLURM_JOB_NODELIST
echo "Number of nodes allocated to the job: " $SLURM_JOB_NUM_NODES
echo "Number of CPU tasks in this job: " $SLURM_NTASKS
echo "Directory from which sbatch was invoked: " $SLURM_SUBMIT_DIR

###################################################
#### 0 Preparation of files and transfer to cluster
###################################################

#### Creation des chemins de repertoires
# Always use these paths when writing paths to files otherwise it will try to take them from your home directory
# change depending on who is using the script/what data is being used

#namelist and reference should be here
path_to_dir_in="/data3/projects/myristica/Capture/Ref_secapr";
path_to_dir_out="/data3/projects/myristica/Capture/Secapr/secapr_arg_loci50_$SLURM_JOB_ID";
path_to_tmp="/scratch/secapr_arg_loci50_$SLURM_JOB_NAME";



#make temporary directory to store files/run analyses in
echo "creating temporary folder";

mkdir $path_to_tmp

echo "finish creating temporary folder";

#copy input files to path
echo "copying files";

scp nas3:/$path_to_dir_in/* $path_to_tmp   ############ Modify nas/nas2

#These steps copy all files in RUN X that have INDEX X
#Change appropriately for the files that are required
echo "copying fastqs";

scp nas3:/data3/projects/myristica/Capture/ARGfastqs/*.fastq $path_to_tmp

echo "done copying fastqs";

echo "done copying all files";

#Change directory to temporary directory and rename fastqs
cd $path_to_tmp

##Renames to the format e.g.I04T44_READ1
##This is different to the hybpiper naming convention (no "_")
echo "renaming files"

echo "Start renaming files in R1";

mv Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-63.fastq I11T0067_READ1.fastq
mv Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-64.fastq I11T0155_READ1.fastq
mv Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-65.fastq I11T0687_READ1.fastq
mv Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-66.fastq I11T0831_READ1.fastq
mv Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-67.fastq I11T0832_READ1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-12.fastq I6T0132_READ1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-13.fastq I6T0122_READ1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-14.fastq I6T0146_READ1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-36.fastq I6T1775_READ1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-38.fastq I6T1618_READ1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-40.fastq I6T1641_READ1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-41.fastq I6T1654_READ1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-42.fastq I6T1663_READ1.fastq
mv Paired-Filter-Cutadapt-Demul-Run2-R1-TAG-57.fastq I6T0163_READ1.fastq
mv Paired-Filter-Cutadapt-Demul-Run2-R1-TAG-61.fastq I6T0227_READ1.fastq
mv pairfiltcut-CAP1-JK_0005_1.fastq I1T0005_READ1.fastq
mv pairfiltcut-CAP1-JK_0007_1.fastq I1T0007_READ1.fastq
mv pairfiltcut-CAP1-JK_0067_1.fastq I1T0068_READ1.fastq
mv pairfiltcut-CAP1-JK_0153_1.fastq I1T0153_READ1.fastq
mv pairfiltcut-CAP1-JK_0677_1.fastq I1T0677_READ1.fastq
mv pairfiltcut-CAP1-JK_0739_1.fastq I1T0739_READ1.fastq
mv pairfiltcut-CAP1-JK_2132_1.fastq I1T2132_READ1.fastq
mv pairfiltcut-CAP1-JK_2251_1.fastq I1T2251_READ1.fastq
mv pairfiltcut-CAP1-JK_2258_1.fastq I1T2258_READ1.fastq
mv pairfiltcut-CAP1-JK_2922_1.fastq I1T2922_READ1.fastq
mv pairfiltcut-CAP1-JK_2934_1.fastq I1T2934_READ1.fastq
mv pairfiltcut-CAP1-JK_2963_1.fastq I1T2963_READ1.fastq
mv pairfiltcut-CAP2-JK_0824_1.fastq I2T0824_READ1.fastq
mv pairfiltcut-CAP2-JK_0834_1.fastq I2T0834_READ1.fastq
mv pairfiltcut-CAP2-JK_0862_1.fastq I2T0862_READ1.fastq
mv pairfiltcut-CAP2-JK_0867_1.fastq I2T0867_READ1.fastq
mv pairfiltcut-CAP2-JK_0902_1.fastq I2T0902_READ1.fastq
mv pairfiltcut-CAP2-JK_0914_1.fastq I2T0914_READ1.fastq
mv pairfiltcut-CAP2-JK_0920_1.fastq I2T0920_READ1.fastq
mv pairfiltcut-CAP2-JK_0927_1.fastq I2T0927_READ1.fastq
mv pairfiltcut-CAP2-JK_0931_1.fastq I2T0931_READ1.fastq
mv pairfiltcut-CAP2-JK_0940_1.fastq I2T0940_READ1.fastq
mv pairfiltcut-CAP2-JK_0955_1.fastq I2T0955_READ1.fastq
mv pairfiltcut-CAP2-JK_0956_1.fastq I2T0956_READ1.fastq
mv pairfiltcut-CAP2-JK_0957_1.fastq I2T0957_READ1.fastq
mv pairfiltcut-CAP2-JK_0983_1.fastq I2T0983_READ1.fastq
mv pairfiltcut-CAP2-JK_0990_1.fastq I2T0990_READ1.fastq
mv pairfiltcut-CAP2-JK_0992_1.fastq I2T0992_READ1.fastq
mv pairfiltcut-CAP2-JK_1001_1.fastq I2T1001_READ1.fastq
mv pairfiltcut-CAP2-JK_1002_1.fastq I2T1002_READ1.fastq
mv pairfiltcut-CAP2-JK_1035_1.fastq I2T1035_READ1.fastq
mv pairfiltcut-CAP2-JK_1036_1.fastq I2T1036_READ1.fastq
mv pairfiltcut-CAP2-JK_1049_1.fastq I2T1049_READ1.fastq
mv pairfiltcut-CAP2-JK_1050_1.fastq I2T1050_READ1.fastq
mv pairfiltcut-CAP2-JK_2217_1.fastq I2T2217_READ1.fastq
mv pairfiltcut-CAP2-JK_2218_1.fastq I2T2218_READ1.fastq
mv pairfiltcut-CAP2-JK_2238_1.fastq I2T2238_READ1.fastq
mv pairfiltcut-CAP2-JK_2239_1.fastq I2T2239_READ1.fastq
mv pairfiltcut-CAP2-JK_2259_1.fastq I2T2259_READ1.fastq
mv pairfiltcut-CAP2-JK_2260_1.fastq I2T2260_READ1.fastq
mv pairfiltcut-CAP4-JK_2464_1.fastq I4T2464_READ1.fastq
mv pairfiltcut-CAP4-JK_3112_1.fastq I4T3112_READ1.fastq
mv pairfiltcut-CAP4-JK_3113_1.fastq I4T3113_READ1.fastq
mv pairfiltcut-CAP4-JK_3115_1.fastq I4T3115_READ1.fastq
mv pairfiltcut-CAP4-JK_3117_1.fastq I4T3117_READ1.fastq
echo "Finished renaming files in R1";

sleep 30s

echo "Start renaming files in R2";
mv R2-Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-63.fastq I11T0067_READ2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-64.fastq I11T0155_READ2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-65.fastq I11T0687_READ2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-66.fastq I11T0831_READ2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-67.fastq I11T0832_READ2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-12.fastq I6T0132_READ2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-13.fastq I6T0122_READ2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-14.fastq I6T0146_READ2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-36.fastq I6T1775_READ2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-38.fastq I6T1618_READ2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-40.fastq I6T1641_READ2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-41.fastq I6T1654_READ2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-42.fastq I6T1663_READ2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run2-R1-TAG-57.fastq I6T0163_READ2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run2-R1-TAG-61.fastq I6T0227_READ2.fastq
mv R2-pairfiltcut-CAP1-JK_0005_1.fastq I1T0005_READ2.fastq
mv R2-pairfiltcut-CAP1-JK_0007_1.fastq I1T0007_READ2.fastq
mv R2-pairfiltcut-CAP1-JK_0067_1.fastq I1T0068_READ2.fastq
mv R2-pairfiltcut-CAP1-JK_0153_1.fastq I1T0153_READ2.fastq
mv R2-pairfiltcut-CAP1-JK_0677_1.fastq I1T0677_READ2.fastq
mv R2-pairfiltcut-CAP1-JK_0739_1.fastq I1T0739_READ2.fastq
mv R2-pairfiltcut-CAP1-JK_2132_1.fastq I1T2132_READ2.fastq
mv R2-pairfiltcut-CAP1-JK_2251_1.fastq I1T2251_READ2.fastq
mv R2-pairfiltcut-CAP1-JK_2258_1.fastq I1T2258_READ2.fastq
mv R2-pairfiltcut-CAP1-JK_2922_1.fastq I1T2922_READ2.fastq
mv R2-pairfiltcut-CAP1-JK_2934_1.fastq I1T2934_READ2.fastq
mv R2-pairfiltcut-CAP1-JK_2963_1.fastq I1T2963_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0824_1.fastq I2T0824_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0834_1.fastq I2T0834_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0862_1.fastq I2T0862_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0867_1.fastq I2T0867_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0902_1.fastq I2T0902_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0914_1.fastq I2T0914_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0920_1.fastq I2T0920_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0927_1.fastq I2T0927_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0931_1.fastq I2T0931_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0940_1.fastq I2T0940_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0955_1.fastq I2T0955_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0956_1.fastq I2T0956_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0957_1.fastq I2T0957_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0983_1.fastq I2T0983_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0990_1.fastq I2T0990_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_0992_1.fastq I2T0992_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_1001_1.fastq I2T1001_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_1002_1.fastq I2T1002_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_1035_1.fastq I2T1035_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_1036_1.fastq I2T1036_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_1049_1.fastq I2T1049_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_1050_1.fastq I2T1050_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_2217_1.fastq I2T2217_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_2218_1.fastq I2T2218_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_2238_1.fastq I2T2238_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_2239_1.fastq I2T2239_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_2259_1.fastq I2T2259_READ2.fastq
mv R2-pairfiltcut-CAP2-JK_2260_1.fastq I2T2260_READ2.fastq
mv R2-pairfiltcut-CAP4-JK_2464_1.fastq I4T2464_READ2.fastq
mv R2-pairfiltcut-CAP4-JK_3112_1.fastq I4T3112_READ2.fastq
mv R2-pairfiltcut-CAP4-JK_3113_1.fastq I4T3113_READ2.fastq
mv R2-pairfiltcut-CAP4-JK_3115_1.fastq I4T3115_READ2.fastq
mv R2-pairfiltcut-CAP4-JK_3117_1.fastq I4T3117_READ2.fastq

echo "Finished renaming files in R2";

echo "done renaming all files"

#Return to home directory

####
#Format input data
####

#namelist must be without "_"
#e.g.
#
#I04T44
#I04T45

mv $path_to_tmp/namelist_argentea.txt $path_to_tmp/namelist.txt

mkdir cleaned_reads

while read name; 
do 
	echo $name
	mkdir ./cleaned_reads/"$name"_clean
	mv "$name"_READ1.fastq ./cleaned_reads/"$name"_clean
	mv "$name"_READ2.fastq ./cleaned_reads/"$name"_clean
done < $path_to_tmp/namelist.txt


####
#Load modules
####

module load bioinfo/SeCaPr/1.1.4
module load system/python/2.7.5
source activate secapr-1.1.4


sleep 10s

##################################################
#### 1 Assembly
##################################################

mkdir contigs

module load bioinfo/abyss/1.3.2

#can't go above 1 core on the cluster at the moment..
secapr assemble_reads --input ./cleaned_reads/ --output ./contigs/ --cores 12 --disable_stats

cd contigs

ls -1 ./ | \
while read sample; \
do 
    sed -r '/^[ACGT]{,200}$/d' ${sample} | grep --no-group-separator -B1 "^[AGCT]"  > long.${sample}
done

rename 'long.' '' *

cd ../

###
# Change reference file here
###

secapr find_target_contigs --contigs ./contigs/ --reference ./Annonaceae_nuc_exons_clustered.fa --output ./target_contigs --keep-duplicates --disable_stats

secapr align_sequences --sequences ./target_contigs/extracted_target_contigs_all_samples.fasta --output ./contig_alignments/ --aligner mafft --output-format fasta --ambiguous

secapr add_missing_sequences --input ./contig_alignments/ --output ./contig_alignments_no_missing/

secapr reference_assembly --reads ./cleaned_reads/ --reference_type alignment-consensus --reference ./contig_alignments --output ./remapped_reads --min_coverage 10

secapr locus_selection --input ./remapped_reads --output ./selected_loci --n 50

secapr phase_alleles --input ./remapped_reads/ --reference ./Annonaceae_nuc_exons_clustered.fa --output ./allele_sequences --min_coverage 5

#fix allele names in fasta file
sed -i -e 's/_0 |/a0 |/g' allele_sequences/joined_allele_fastas.fasta
sed -i -e 's/_1 |/a1 |/g' allele_sequences/joined_allele_fastas.fasta

secapr align_sequences --sequences ./allele_sequences/joined_allele_fastas.fasta --output ./allele_alignments/ --aligner mafft --output-format fasta --ambiguous

secapr add_missing_sequences --input ./allele_alignments/ --output ./loci_allele_alignments_complete/


##################################################
#### 5 clean up and transfer
##################################################

#source deactivate

sleep 10s

module unload bioinfo/SeCaPr/1.1.4 

#Transfert des donnees du noeud vers master

echo "Transfert data node -> master";

#make output folder in home directory
mkdir $path_to_dir_out

# remove cleaned reads (raw)
rm -r $path_to_tmp/cleaned_reads
scp -rp $path_to_tmp/* $path_to_dir_out 

# could move these to nas2 instead if need to store

echo "done moving";

#### Suppression du repertoire tmp noeud

echo "Deleting data on node";
#rm -rf $path_to_tmp
echo "Done deleting, FINISHED!";

