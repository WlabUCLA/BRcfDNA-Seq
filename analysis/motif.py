
import os
import sys
import numpy as np
import csv
class Readsamfile:
    
    reads_lenght = [0]*350
    motiflis_beg = [0]*256
    motiflist_end = [0]*256
    motiflist_both= [0]*256
    allmotif = ['AAAA','AAAC','AAAG','AAAT','AACA','AACC','AACG','AACT','AAGA','AAGC','AAGG','AAGT','AATA','AATC','AATG','AATT','ACAA','ACAC','ACAG','ACAT','ACCA','ACCC','ACCG','ACCT','ACGA','ACGC','ACGG','ACGT','ACTA','ACTC','ACTG','ACTT','AGAA','AGAC','AGAG','AGAT','AGCA','AGCC','AGCG','AGCT','AGGA','AGGC','AGGG','AGGT','AGTA','AGTC','AGTG','AGTT','ATAA','ATAC','ATAG','ATAT','ATCA','ATCC','ATCG','ATCT','ATGA','ATGC','ATGG','ATGT','ATTA','ATTC','ATTG','ATTT','CAAA','CAAC','CAAG','CAAT','CACA','CACC','CACG','CACT','CAGA','CAGC','CAGG','CAGT','CATA','CATC','CATG','CATT','CCAA','CCAC','CCAG','CCAT','CCCA','CCCC','CCCG','CCCT','CCGA','CCGC','CCGG','CCGT','CCTA','CCTC','CCTG','CCTT','CGAA','CGAC','CGAG','CGAT','CGCA','CGCC','CGCG','CGCT','CGGA','CGGC','CGGG','CGGT','CGTA','CGTC','CGTG','CGTT','CTAA','CTAC','CTAG','CTAT','CTCA','CTCC','CTCG','CTCT','CTGA','CTGC','CTGG','CTGT','CTTA','CTTC','CTTG','CTTT','GAAA','GAAC','GAAG','GAAT','GACA','GACC','GACG','GACT','GAGA','GAGC','GAGG','GAGT','GATA','GATC','GATG','GATT','GCAA','GCAC','GCAG','GCAT','GCCA','GCCC','GCCG','GCCT','GCGA','GCGC','GCGG','GCGT','GCTA','GCTC','GCTG','GCTT','GGAA','GGAC','GGAG','GGAT','GGCA','GGCC','GGCG','GGCT','GGGA','GGGC','GGGG','GGGT','GGTA','GGTC','GGTG','GGTT','GTAA','GTAC','GTAG','GTAT','GTCA','GTCC','GTCG','GTCT','GTGA','GTGC','GTGG','GTGT','GTTA','GTTC','GTTG','GTTT','TAAA','TAAC','TAAG','TAAT','TACA','TACC','TACG','TACT','TAGA','TAGC','TAGG','TAGT','TATA','TATC','TATG','TATT','TCAA','TCAC','TCAG','TCAT','TCCA','TCCC','TCCG','TCCT','TCGA','TCGC','TCGG','TCGT','TCTA','TCTC','TCTG','TCTT','TGAA','TGAC','TGAG','TGAT','TGCA','TGCC','TGCG','TGCT','TGGA','TGGC','TGGG','TGGT','TGTA','TGTC','TGTG','TGTT','TTAA','TTAC','TTAG','TTAT','TTCA','TTCC','TTCG','TTCT','TTGA','TTGC','TTGG','TTGT','TTTA','TTTC','TTTG','TTTT']
    def __init__(self,samfile, outputfile ):
        self.outputfile = outputfile
        self.data =  self.readfile(samfile, outputfile )
        
       
        
    
    def analysemotif(self, read_list):     
        
        for read in read_list:
            motif = self.findmotif( read, 0)
            if 'N' not in motif and len(motif)>3 :
                indexof =Readsamfile.allmotif.index(motif)
                Readsamfile.motiflis_beg[indexof] +=1
                Readsamfile.motiflist_both[indexof] +=1
                    
            motif = self.findmotif( read, 1)
            if 'N' not in motif and len(motif)>3:
                indexof =Readsamfile.allmotif.index(motif)
                Readsamfile.motiflist_end[indexof] +=1
                Readsamfile.motiflist_both[indexof] +=1
                
        
        
    def findmotif(self, read, typeof):
        if typeof ==0:
            motif= read[0:4]
        elif typeof ==1:
            motif= read[-4:]
        return motif

    # @staticmethod
    def stat_reads(self):
        print(self.data)
        return self.data

    def writet_list_to_file(self, filename, my_list):
        
        file = open(filename, 'a+', newline ='')
        with file:   
            write = csv.writer(file)
            write.writerows(my_list)
        
        # with open(filename, 'a+') as f:
        #     for item in my_list:
        #         f.write("%s\n" % item) 
    def getnormalizedmotiddata(self, motiflist, outputfile):
        # unique_value, counts = np.unique(motiflist, return_counts=True)
        # sumall = np.sum(motiflist)
        # print(counts , sumall)
        # counts = [float(i*1000)/sumall for i in counts]
        # print(counts , sumall)
        # unique_value, counts = zip(*sorted(zip(unique_value, counts)))
        # q=[unique_value, counts]
        # self.writet_list_to_file(outputfile, q)
        
        
        sumall = np.sum(motiflist)
        print('sumall', sumall)
        counts = [float(i*1000)/sumall for i in motiflist]
        print(counts)
        print(outputfile)
        self.writet_list_to_file(outputfile, [counts])
        
        
        
    def computemotif(self,listofcouple):
       self.analysemotif(listofcouple )
        
    
    def readfile(self, samfile, outputfile ):
        """_summary_

        Args:
            samfile (_type_): _description_
            outputfile (_type_): _description_
        """
     
        totalqualityzero = 0
        first_read = []
        second_read = []
        third_read = []
        Error_readlength = []
        error_length_zero = []
        listof_couple_line =[] 
        listof_single_line =[] 
        
        numberofread = 0
        with open(samfile, 'r') as f:
            
            
            for line in f:
                
                numberofread +=1

                if len(listof_single_line )>100000:
                    self.computemotif(listof_single_line)
                    listof_single_line = []
                    
                
            
                """
                Skip Header
                """
                if '@'  in line[:4]:
                    printtifile = False
                    # Outputfile.Outputfile.writet_string_to_file(Param.Param.get_samfilename(),line.strip())
                elif '@' not in line[:4] :#and 'chrM'   in line.split()[2]:

                    info = line.split()
                    if len(info)>1 and int(info[1])>2047 :
                        continue
            
                    """
                    First line is Forward strand and second line is revers strand
                    """
                    if len(first_read) == 0:
                        
                        """_summary_
                        if reads can aligne to more than 1 position then flag be more than 2047 for second option
                        """
                        if len(info)>1 and int(info[1])>2047 :
                            third_read.append(info)  
                            third_read = []
                        elif  len(info)<= 1:
                            Error_readlength.append(info)
                            Error_readlength = []
                
                        """_summary_
                        Aligner couls not alin the read
                        """
                        
                        first_read = info
                        listof_single_line.append(info[9])
                        first_read = []
                            
                        
                        

        if len(listof_couple_line )>0 :
            self.computemotif(listof_couple_line)   
            
        self.getnormalizedmotiddata( Readsamfile.motiflis_beg, outputfile)     
        self.getnormalizedmotiddata( Readsamfile.motiflist_end, outputfile) 
        self.getnormalizedmotiddata( Readsamfile.motiflist_both, outputfile)     
                        
                        
def main(argv):
    samfile = argv[0]   
    outputfile =    samfile+'_motif.csv'    
    R = Readsamfile(samfile,outputfile)              
                


if __name__ == "__main__":
   main(sys.argv[1:])
   
