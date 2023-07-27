import numpy as np
import matplotlib.pyplot as plt
import sys

class frag():
    
    
    
    def __init__(self, numberofchrom, windows_length ,numberofbin, minsizeA,maxsizeA, maxsizeB, inputfile, outputfile ):
        
        
        self.numberofchrom = numberofchrom
        self.windows_length = windows_length
        self.numberofbin = numberofbin
        self.inputfile = inputfile
        self.outputfile = outputfile
        self.minsizeA = minsizeA
        self.maxsizeA = maxsizeA
        self.maxsizeB = maxsizeB
        self.allinfoA = np.zeros((self.numberofchrom , self.numberofbin))
        self.allinfoB= np.zeros((self.numberofchrom , self.numberofbin))
        
        self.readfile(self.inputfile)
        
        print(self.allinfoA)
        print(self.allinfoB)
        self.writeinfile(self.outputfile ) 
        plt.plot(self.allinfoA)
        plt.show()
        
        plt.plot(self.allinfoB)
        plt.show()
        
        
        
        
    def readfile(self, filename):
        
        
        
        with open(filename) as fp:
#             print(filename)
            line = fp.readline()
            cnt = 1

            while line:
                
                line= str(line).strip().split()
               
                cnt += 1   
                
                self.analyse_line(line , self.minsizeA,self.maxsizeA ,self.maxsizeB)
#                 if cnt>200:
#                     return
                line = fp.readline()
                
                
    def analyse_lines(self,list_line):
        pass
    
    def analyse_line(self,line , minsizeA,maxsizeA ,maxsizeB):
    
        if len(line) > 10:
            chrom = str(line[2].replace('chr', ''))
           
            if 'X' in chrom or 'x' in chrom:
                chrom = 23
            elif 'Y' in chrom or 'y' in chrom:
                chrom = 24
            else:
                chrom = int(chrom)
            
            bin_index = int(int(line[3]) / self.windows_length)
            
            lengthof = len(line[9])
            if lengthof >= minsizeA  and lengthof < maxsizeA :
                self.allinfoA[chrom , bin_index ] +=1
                
            elif lengthof >= maxsizeA  and  lengthof < maxsizeB :
                self.allinfoB[chrom , bin_index ] +=1
                
                
           
    def writeinfile(self, outputfile )   :
    
        with open(outputfile, 'w') as f:

            for x in range(self.numberofchrom):

                for y in range(self.numberofbin):
                    if self.allinfoA[x , y ] != 0 and self.allinfoB[x , y ] != 0:
                        line = str('chromosom:') + ',' +str(x) + ',' +str('Bin Index:') + ',' + str(y) + ',' +str(f'NUmber of reads in range { self.minsizeA} until { self.maxsizeA}') + ',' + str(self.allinfoA[x , y ]) + ', ' +str(f'NUmber of reads in range { self.maxsizeA} until { self.maxsizeB}') + ',' + str(str(self.allinfoB[x , y ])) \
                        +','+ \
                         str('Normalized A:') + ',' +str(   float((self.allinfoA[x , y ]))/( float((self.allinfoA[x , y ]))+float((self.allinfoB[x , y ])) )) +','+ \
                         str('Normalized B:') + ',' +str(   float((self.allinfoB[x , y ]))/(  float((self.allinfoA[x , y ]))+float((self.allinfoB[x , y ])) )) +','+ \
                         str('Ratio') + ',' +str(  (float((self.allinfoA[x , y ]))/(  float((self.allinfoA[x , y ]))+float((self.allinfoB[x , y ])) ))/( float((self.allinfoB[x , y ]))/(  float((self.allinfoA[x , y ]))+float((self.allinfoB[x , y ])) )) )+'\n' 
                        f.write(line)
                
                
                


def main(argv):      
    
    numberofchrom = int(argv[0])  #25
    windows_length = int(argv[1]) #1000000
    numberofbin = int(argv[2]) #300
    minsizeA = int(argv[3])# 120
    maxsizeA =int(argv[4]) #167
    maxsizeB =int(argv[5]) #250


    inputfile = argv[6]#'./LS17_R1.fastq.gz_merged_SCremoved_Nucl_sorted.bam_120_250_sorted.bam_.sam'
    outputfile = inputfile+'_'+str(windows_length)+'_'+str(minsizeA)+'_'+str(maxsizeA)+'_'+str(maxsizeB)+'_Delfi_frag.csv'
    f = frag( numberofchrom, windows_length, numberofbin ,minsizeA ,maxsizeA , maxsizeB, inputfile, outputfile  )


if __name__ == "__main__":
   main(sys.argv[1:])
   
