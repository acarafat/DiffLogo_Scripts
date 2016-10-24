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

# A function that will subset original motif pwa
motif_subsetter <- function(i){
  motif_subset <- list()
  j <- i + 19
  for (m in motif_names){
    pwm_subset <- as.matrix(motifs[[m]][,i:j])
    motif_subset[[m]] <- pwm_subset
  }
  return(motif_subset)
}


# A loop that will generate subset of motifs/PWAs in sliding window and produce DiffLogo table
for (i in seq(1, 212, 20)){
  diffLogoTable(motif_subsetter(i), alphabet = ASN)
}

