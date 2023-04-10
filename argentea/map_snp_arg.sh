#!/bin/bash

###### Configuration SLURM#################################
## Name of the job:
#SBATCH --job-name=map_snp_arg50
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=12
#SBATCH --mail-user=jakty.kusuma@ird.fr
#SBATCH --mail-type=ALL
#SBATCH -p normal
############################################################

###################################################
#### 0 Preparation of files and transfer to cluster
###################################################

#### Creation des chemins de repertoires
# Always use these paths when writing paths to files otherwise it will try to take them from your home directory
# change depending on who is using the script/what data is being used

#reference folder should contain
# all joined_fasta_library files
# parallel_gvcf.txt
# parallel_index.txt
# parallel_readgroups.txt
path_to_ref="/data3/projects/myristica/Capture/Secapr/ref_arg50/";
path_to_names="/data3/projects/myristica/Capture/Secapr/namelist/";
path_to_dir_out="/data3/projects/myristica/Capture/Secapr/map_snp_arg50_$SLURM_JOB_ID/";
path_to_tmp="/scratch/secapr_map_arg50_$SLURM_JOB_ID";

#### Creation du repertoire temporaire sur noeud
echo "copying files";

#make temporary directory to store files/run analyses in
mkdir $path_to_tmp

scp $path_to_ref/* $path_to_tmp   ############ Modifier nas/nas2
scp $path_to_names/* $path_to_tmp   ############ Modifier nas/nas2

#These steps copy all files in RUN X that have INDEX X
#Change appropriately for the files that are required
echo "copying fastqs";

scp nas3:/data3/projects/myristica/Capture/ARGfastqs/*.fastq $path_to_tmp

echo "done copying fastqs";

echo "done copying all files";

#Change directory to temporary directory to gunzip and rename fastqs
cd $path_to_tmp

#Renames to the format e.g.I04_T44_R1
echo "renaming files"

echo "Start renaming files in R1";

mv Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-63.fastq I11_T0067_R1.fastq
mv Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-64.fastq I11_T0155_R1.fastq
mv Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-65.fastq I11_T0687_R1.fastq
mv Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-66.fastq I11_T0831_R1.fastq
mv Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-67.fastq I11_T0832_R1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-12.fastq I6_T0132_R1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-13.fastq I6_T0122_R1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-14.fastq I6_T0146_R1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-36.fastq I6_T1775_R1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-38.fastq I6_T1618_R1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-40.fastq I6_T1641_R1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-41.fastq I6_T1654_R1.fastq
mv Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-42.fastq I6_T1663_R1.fastq
mv Paired-Filter-Cutadapt-Demul-Run2-R1-TAG-57.fastq I6_T0163_R1.fastq
mv Paired-Filter-Cutadapt-Demul-Run2-R1-TAG-61.fastq I6_T0227_R1.fastq
mv pairfiltcut-CAP1-JK_0005_1.fastq I1_T0005_R1.fastq
mv pairfiltcut-CAP1-JK_0007_1.fastq I1_T0007_R1.fastq
mv pairfiltcut-CAP1-JK_0067_1.fastq I1_T0068_R1.fastq
mv pairfiltcut-CAP1-JK_0153_1.fastq I1_T0153_R1.fastq
mv pairfiltcut-CAP1-JK_0677_1.fastq I1_T0677_R1.fastq
mv pairfiltcut-CAP1-JK_0739_1.fastq I1_T0739_R1.fastq
mv pairfiltcut-CAP1-JK_2132_1.fastq I1_T2132_R1.fastq
mv pairfiltcut-CAP1-JK_2251_1.fastq I1_T2251_R1.fastq
mv pairfiltcut-CAP1-JK_2258_1.fastq I1_T2258_R1.fastq
mv pairfiltcut-CAP1-JK_2922_1.fastq I1_T2922_R1.fastq
mv pairfiltcut-CAP1-JK_2934_1.fastq I1_T2934_R1.fastq
mv pairfiltcut-CAP1-JK_2963_1.fastq I1_T2963_R1.fastq
mv pairfiltcut-CAP2-JK_0824_1.fastq I2_T0824_R1.fastq
mv pairfiltcut-CAP2-JK_0834_1.fastq I2_T0834_R1.fastq
mv pairfiltcut-CAP2-JK_0862_1.fastq I2_T0862_R1.fastq
mv pairfiltcut-CAP2-JK_0867_1.fastq I2_T0867_R1.fastq
mv pairfiltcut-CAP2-JK_0902_1.fastq I2_T0902_R1.fastq
mv pairfiltcut-CAP2-JK_0914_1.fastq I2_T0914_R1.fastq
mv pairfiltcut-CAP2-JK_0920_1.fastq I2_T0920_R1.fastq
mv pairfiltcut-CAP2-JK_0927_1.fastq I2_T0927_R1.fastq
mv pairfiltcut-CAP2-JK_0931_1.fastq I2_T0931_R1.fastq
mv pairfiltcut-CAP2-JK_0940_1.fastq I2_T0940_R1.fastq
mv pairfiltcut-CAP2-JK_0955_1.fastq I2_T0955_R1.fastq
mv pairfiltcut-CAP2-JK_0956_1.fastq I2_T0956_R1.fastq
mv pairfiltcut-CAP2-JK_0957_1.fastq I2_T0957_R1.fastq
mv pairfiltcut-CAP2-JK_0983_1.fastq I2_T0983_R1.fastq
mv pairfiltcut-CAP2-JK_0990_1.fastq I2_T0990_R1.fastq
mv pairfiltcut-CAP2-JK_0992_1.fastq I2_T0992_R1.fastq
mv pairfiltcut-CAP2-JK_1001_1.fastq I2_T1001_R1.fastq
mv pairfiltcut-CAP2-JK_1002_1.fastq I2_T1002_R1.fastq
mv pairfiltcut-CAP2-JK_1035_1.fastq I2_T1035_R1.fastq
mv pairfiltcut-CAP2-JK_1036_1.fastq I2_T1036_R1.fastq
mv pairfiltcut-CAP2-JK_1049_1.fastq I2_T1049_R1.fastq
mv pairfiltcut-CAP2-JK_1050_1.fastq I2_T1050_R1.fastq
mv pairfiltcut-CAP2-JK_2217_1.fastq I2_T2217_R1.fastq
mv pairfiltcut-CAP2-JK_2218_1.fastq I2_T2218_R1.fastq
mv pairfiltcut-CAP2-JK_2238_1.fastq I2_T2238_R1.fastq
mv pairfiltcut-CAP2-JK_2239_1.fastq I2_T2239_R1.fastq
mv pairfiltcut-CAP2-JK_2259_1.fastq I2_T2259_R1.fastq
mv pairfiltcut-CAP2-JK_2260_1.fastq I2_T2260_R1.fastq
mv pairfiltcut-CAP4-JK_2464_1.fastq I4_T2464_R1.fastq
mv pairfiltcut-CAP4-JK_3112_1.fastq I4_T3112_R1.fastq
mv pairfiltcut-CAP4-JK_3113_1.fastq I4_T3113_R1.fastq
mv pairfiltcut-CAP4-JK_3115_1.fastq I4_T3115_R1.fastq
mv pairfiltcut-CAP4-JK_3117_1.fastq I4_T3117_R1.fastq
echo "Finished renaming files in R1";

sleep 30s

echo "Start renaming files in R2";
mv R2-Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-63.fastq I11_T0067_R2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-64.fastq I11_T0155_R2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-65.fastq I11_T0687_R2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-66.fastq I11_T0831_R2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run11-R1-TAG-67.fastq I11_T0832_R2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-12.fastq I6_T0132_R2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-13.fastq I6_T0122_R2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-14.fastq I6_T0146_R2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-36.fastq I6_T1775_R2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-38.fastq I6_T1618_R2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-40.fastq I6_T1641_R2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-41.fastq I6_T1654_R2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run1-R1-TAG-42.fastq I6_T1663_R2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run2-R1-TAG-57.fastq I6_T0163_R2.fastq
mv R2-Paired-Filter-Cutadapt-Demul-Run2-R1-TAG-61.fastq I6_T0227_R2.fastq
mv R2-pairfiltcut-CAP1-JK_0005_1.fastq I1_T0005_R2.fastq
mv R2-pairfiltcut-CAP1-JK_0007_1.fastq I1_T0007_R2.fastq
mv R2-pairfiltcut-CAP1-JK_0067_1.fastq I1_T0068_R2.fastq
mv R2-pairfiltcut-CAP1-JK_0153_1.fastq I1_T0153_R2.fastq
mv R2-pairfiltcut-CAP1-JK_0677_1.fastq I1_T0677_R2.fastq
mv R2-pairfiltcut-CAP1-JK_0739_1.fastq I1_T0739_R2.fastq
mv R2-pairfiltcut-CAP1-JK_2132_1.fastq I1_T2132_R2.fastq
mv R2-pairfiltcut-CAP1-JK_2251_1.fastq I1_T2251_R2.fastq
mv R2-pairfiltcut-CAP1-JK_2258_1.fastq I1_T2258_R2.fastq
mv R2-pairfiltcut-CAP1-JK_2922_1.fastq I1_T2922_R2.fastq
mv R2-pairfiltcut-CAP1-JK_2934_1.fastq I1_T2934_R2.fastq
mv R2-pairfiltcut-CAP1-JK_2963_1.fastq I1_T2963_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0824_1.fastq I2_T0824_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0834_1.fastq I2_T0834_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0862_1.fastq I2_T0862_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0867_1.fastq I2_T0867_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0902_1.fastq I2_T0902_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0914_1.fastq I2_T0914_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0920_1.fastq I2_T0920_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0927_1.fastq I2_T0927_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0931_1.fastq I2_T0931_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0940_1.fastq I2_T0940_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0955_1.fastq I2_T0955_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0956_1.fastq I2_T0956_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0957_1.fastq I2_T0957_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0983_1.fastq I2_T0983_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0990_1.fastq I2_T0990_R2.fastq
mv R2-pairfiltcut-CAP2-JK_0992_1.fastq I2_T0992_R2.fastq
mv R2-pairfiltcut-CAP2-JK_1001_1.fastq I2_T1001_R2.fastq
mv R2-pairfiltcut-CAP2-JK_1002_1.fastq I2_T1002_R2.fastq
mv R2-pairfiltcut-CAP2-JK_1035_1.fastq I2_T1035_R2.fastq
mv R2-pairfiltcut-CAP2-JK_1036_1.fastq I2_T1036_R2.fastq
mv R2-pairfiltcut-CAP2-JK_1049_1.fastq I2_T1049_R2.fastq
mv R2-pairfiltcut-CAP2-JK_1050_1.fastq I2_T1050_R2.fastq
mv R2-pairfiltcut-CAP2-JK_2217_1.fastq I2_T2217_R2.fastq
mv R2-pairfiltcut-CAP2-JK_2218_1.fastq I2_T2218_R2.fastq
mv R2-pairfiltcut-CAP2-JK_2238_1.fastq I2_T2238_R2.fastq
mv R2-pairfiltcut-CAP2-JK_2239_1.fastq I2_T2239_R2.fastq
mv R2-pairfiltcut-CAP2-JK_2259_1.fastq I2_T2259_R2.fastq
mv R2-pairfiltcut-CAP2-JK_2260_1.fastq I2_T2260_R2.fastq
mv R2-pairfiltcut-CAP4-JK_2464_1.fastq I4_T2464_R2.fastq
mv R2-pairfiltcut-CAP4-JK_3112_1.fastq I4_T3112_R2.fastq
mv R2-pairfiltcut-CAP4-JK_3113_1.fastq I4_T3113_R2.fastq
mv R2-pairfiltcut-CAP4-JK_3115_1.fastq I4_T3115_R2.fastq
mv R2-pairfiltcut-CAP4-JK_3117_1.fastq I4_T3117_R2.fastq

echo "Finished renaming files in R2";

echo "done renaming all files"

module load bioinfo/picard-tools
module load bioinfo/gatk

###################################################
#### 1 reads_first
###################################################

echo "starting reads_first";
cd $path_to_tmp

java -Xmx4g -jar $PICARD_PATH/picard.jar CreateSequenceDictionary R= joined_fasta_library.fasta O= joined_fasta_library.dict

mv $path_to_tmp/namelist_argentea_map.txt $path_to_tmp/namelist.txt

#A loop that reads names of samples in namelist and runs reads_first.py part of the hybpiper pipeline
while read name; do 
	echo "bwa mem $path_to_tmp/joined_fasta_library.fasta $path_to_tmp/"$name"_R1.fastq $path_to_tmp/"$name"_R2.fastq > "$name".sam"
done < $path_to_tmp/namelist.txt | parallel -j10

ls *.sam | parallel -j 10 'samtools sort --output-fmt=BAM {} > {.}_sorted.bam'

while read name; do 
	echo "java -Xmx4g -jar $PICARD_PATH/picard.jar MarkDuplicates I="$name"_sorted.bam O="$name"_sorted_nodup.bam M="$name"_dup.txt REMOVE_DUPLICATES=true"
done < $path_to_tmp/namelist.txt | parallel -j10

parallel -j 10 < ./parallel_readgroups.txt

parallel -j 10 < ./parallel_index.txt
#
parallel -j 10 < ./parallel_gvcf.txt
#

###
# add names of your individuals and anni.g.vcf to the one with your group
###
gatk CombineGVCFs -R joined_fasta_library.fasta -V I11_T0067.g.vcf -V I11_T0155.g.vcf -V I11_T0687.g.vcf -V I11_T0831.g.vcf -V I11_T0832.g.vcf -V I6_T0132.g.vcf -V I6_T0122.g.vcf -V I6_T0146.g.vcf -V I6_T1775.g.vcf -V I6_T1618.g.vcf -V I6_T1641.g.vcf -V I6_T1654.g.vcf -V I6_T1663.g.vcf -V I6_T0163.g.vcf -V I6_T0227.g.vcf -V I1_T0005.g.vcf -V I1_T0007.g.vcf -V I1_T0068.g.vcf -V I1_T0153.g.vcf -V I1_T0677.g.vcf -V I1_T0739.g.vcf -V I1_T2132.g.vcf -V I1_T2251.g.vcf -V I1_T2258.g.vcf -V I1_T2922.g.vcf -V I1_T2934.g.vcf -V I1_T2963.g.vcf -V I2_T0824.g.vcf -V I2_T0834.g.vcf -V I2_T0862.g.vcf -V I2_T0867.g.vcf -V I2_T0902.g.vcf -V I2_T0914.g.vcf -V I2_T0920.g.vcf -V I2_T0927.g.vcf -V I2_T0931.g.vcf -V I2_T0940.g.vcf -V I2_T0955.g.vcf -V I2_T0956.g.vcf -V I2_T0957.g.vcf -V I2_T0983.g.vcf -V I2_T0990.g.vcf -V I2_T0992.g.vcf -V I2_T1001.g.vcf -V I2_T1002.g.vcf -V I2_T1035.g.vcf -V I2_T1036.g.vcf -V I2_T1049.g.vcf -V I2_T1050.g.vcf -V I2_T2217.g.vcf -V I2_T2218.g.vcf -V I2_T2238.g.vcf -V I2_T2239.g.vcf -V I2_T2259.g.vcf -V I2_T2260.g.vcf -V I4_T2464.g.vcf -V I4_T3112.g.vcf -V I4_T3113.g.vcf -V I4_T3115.g.vcf -V I4_T3117.g.vcf -O argentea_SNP.g.vcf

#change anni to your group name
gatk GenotypeGVCFs -R joined_fasta_library.fasta -V argentea_SNP.g.vcf -G StandardAnnotation -new-qual -O argentea_SNP.vcf 

echo "done map and sort";

pwd
cd $path_to_tmp
pwd

##################################################
#### 5 clean up and transfer
##################################################

echo "Delete data";

rm $path_to_tmp/*.fastq
rm $path_to_tmp/*.bam

echo "Done deleting data";

#Transfert des donnees du noeud vers master

echo "Transfert data node -> master";

#make output folder in home directory
mkdir $path_to_dir_out

#Copies statistics and retrieved sequences to output folder in home directory

scp -rp $path_to_tmp/ $path_to_dir_out

echo "done moving";

#### Suppression du repertoire tmp noeud

echo "Deleting data on node";
rm -rf $path_to_tmp
echo "Done deleting, FINISHED!";
