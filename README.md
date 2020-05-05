# simulation of 《Differential cryptanalysis of image cipher using block-based scrambling and image filtering》

## `main.m` is the entry
1. generate the secret keys
2. encrypt the plain image
3. decrypt the encrypted image
4. run the improved algorithm
5. compare performance between original and improved algorithm
6. draw the histogram of the plain/encrypted image
7. generate binary text files for NIST testing
8. analysis of anti differential attack ability (NPCR UACI)
9. adjacent pixel correlation
10. select plaintext attack (codebook)

## `computeComparedData.m` is the entry
* generate the data used in paper; compare IC-BSIF and improved algorithm
1. compute the NPCR and UACI (6.2.2)
2. compute the correlations (6.2.2)
3. compute the efficiency (6.3)
