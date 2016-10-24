library("DiffLogo")

##############################################################
# Creating & saving of position weight matrix from alignment #
##############################################################

# Input file should contain one sequence per line. 
# DNA/ASN as alphabet
pwmA <- getPwmFromAlignment(readLines(file.choose()), ASN, 0)
pwmO <- getPwmFromAlignment(readLines(file.choose()), ASN, 0)
pwmAsia <- getPwmFromAlignment(readLines(file.choose()), ASN, 0)
pwmC <- getPwmFromAlignment(readLines(file.choose()), ASN, 0)
pwmSAT1 <- getPwmFromAlignment(readLines(file.choose()), ASN, 0)
pwmSAT2 <- getPwmFromAlignment(readLines(file.choose()), ASN, 0)
pwmSAT3 <- getPwmFromAlignment(readLines(file.choose()), ASN, 0)

# Save the pwms in csv format
write.table(pwmA, 'Type A.csv', sep='\t', row.names = FALSE, col.names = FALSE, na='0')
write.table(pwmO, 'Type O.csv', sep='\t', row.names = FALSE, col.names = FALSE,na='0')
write.table(pwmAsia, 'Type Asia1.csv', sep='\t', row.names = FALSE, col.names = FALSE,na='0')
write.table(pwmC, 'Type C.csv', sep='\t', row.names = FALSE, col.names = FALSE,na='0')
write.table(pwmSAT1, 'Type SAT1.csv', sep='\t', row.names = FALSE, col.names = FALSE,na='0')
write.table(pwmSAT2, 'Type SAT2.csv', sep='\t', row.names = FALSE, col.names = FALSE,na='0')
write.table(pwmSAT3, 'Type SAT3.csv', sep='\t', row.names = FALSE, col.names = FALSE,na='0')

######################
# Experimental Codes #
######################

# Create object for DiffLogo and visualize it
diffLogoObj = createDiffLogoObject(pwm1 = pwmA[,1:10], pwm2 = pwmO[,1:10])
diffLogo(diffLogoObj)

# Creating DiffLogo table
PWMs = list()
PWMs[['A']] <- pwmA[,1:40]
PWMs[['O']] <- pwmO[,1:40]
PWMs[['Asia']] <- pwmAsia[,1:40]
PWMs[['C']] <- pwmC[,1:40]
PWMs[['SAT1']] <- pwmSAT1[,1:40]
PWMs[['SAT2']] <- pwmSAT2[,1:40]
PWMs[['SAT3']] <- pwmSAT3[,1:40]

diffLogoTable(PWMs, alphabet = ASN)


###########################
# DiffLogo Implementation #
###########################

motif_folder <- '/home/arafat/Documents/Research Projects/Work in Progress/FMDV Serotype Problem/Primary Analysis/Dataset/Motifs'
motif_names = c("Type A", "Type Asia1", "Type C", "Type O")
motifs = list()

for (name in motif_names) {
  fileName = paste(motif_folder,'/',name, '.csv', sep='')
  motifs[[name]] = as.matrix(read.csv(fileName, sep='\t', header=FALSE))
}

# Subsetting: create new list of pwm containing 30/40 bp 

# Do difflogotable analysis in sliding window fashion
