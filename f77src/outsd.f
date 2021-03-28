      SUBROUTINE outsd(I,NT,NE,NAX,NDX,NTX,NEX,NHW,NHE,NVN,NVS)
C
C     THIS SUBROUTINE WRITES DAILY OUTPUT FOR SOIL
C     C, N, P, WATER AND HEAT TO OUTPUT FILES DEPENDING
C     ON SELECTIONS MADE IN OUTPUT CONTROL FILES IN
C     THE RUN SCRIPT
C
      include "parameters.h"
      include "filec.h"
      include "files.h"
      include "blkc.h"
      include "blk2a.h"
      include "blk2b.h"
      include "blk2c.h"
      include "blk8a.h"
      include "blk8b.h"
      include "blk11a.h"
      include "blk11b.h"
      include "blk13a.h"
      include "blk13b.h"
      include "blk13c.h"
      include "blk16.h"
      include "blk18a.h"
      include "blk18b.h"
      include "blk19a.h"
      include "blk19b.h"
      CHARACTER*16 DATA(30),DATAC(30,250,250),DATAP(JP,JY,JX)
     2,DATAM(JP,JY,JX),DATAX(JP),DATAY(JP),DATAZ(JP,JY,JX)
     3,OUTS(10),OUTP(10),OUTFILS(10,JY,JX),OUTFILP(10,JP,JY,JX)
      CHARACTER*3 CHOICE(102,20)
      CHARACTER*8 CDATE
      DIMENSION HEAD(50)
      DO 1040 N=26,30
      IF(DATAC(N,NE,NEX).NE.'NO')THEN
      DO 1010 M=1,50
      HEAD(M)=0.0
1010  CONTINUE
      LUN=N+10
      DO 9995 NX=NHW,NHE
      DO 9990 NY=NVN,NVS
C
C     WRITE DAILY SOIL DATA TO OUTPUT FILES
C
      M=0
C
C     DAILY SOIL C OUTPUT
C
      IF(N.EQ.26)THEN
      IF(I.GE.IDATA(N).AND.I.LE.IDATA(N+20))THEN
      DO 1026 K=1,50
      IF(CHOICE(K,N-20).EQ.'YES')THEN
      M=M+1
      IF(K.EQ.1)HEAD(M)=URSDC(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.2)HEAD(M)=UORGC(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.3)HEAD(M)=UORGF(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.4)HEAD(M)=UXCSN(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.5)HEAD(M)=UCO2G(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.6)HEAD(M)=UOXYG(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.7)HEAD(M)=UCOP(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.8)HEAD(M)=TOMT(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.9)HEAD(M)=ORGC(0,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.10)HEAD(M)=UCH4G(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.11)HEAD(M)=UDOCQ(NY,NX)/TAREA
      IF(K.EQ.12)HEAD(M)=UDOCD(NY,NX)/TAREA
      IF(K.EQ.13)HEAD(M)=UDICQ(NY,NX)/TAREA
      IF(K.EQ.14)HEAD(M)=UDICD(NY,NX)/TAREA
      IF(K.EQ.15)HEAD(M)=CO2E(NY,NX)
      IF(K.EQ.16)HEAD(M)=TNBP(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.17)HEAD(M)=UCO2F(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.18)HEAD(M)=ORGC(1,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.19)HEAD(M)=ORGC(2,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.20)HEAD(M)=ORGC(3,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.21)HEAD(M)=ORGC(4,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.22)HEAD(M)=ORGC(5,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.23)HEAD(M)=ORGC(6,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.24)HEAD(M)=ORGC(7,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.25)HEAD(M)=ORGC(8,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.26)HEAD(M)=ORGC(9,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.27)HEAD(M)=ORGC(10,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.28)HEAD(M)=ORGC(11,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.29)HEAD(M)=ORGC(12,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.30)HEAD(M)=ORGC(13,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.31)HEAD(M)=ORGC(14,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.32)HEAD(M)=ORGC(15,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.41)HEAD(M)=UH2GG(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.42)HEAD(M)=XHVSTC(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.43)HEAD(M)=ARLFC(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.44)HEAD(M)=TGPP(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.45)HEAD(M)=TRAU(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.46)HEAD(M)=TNPP(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.47)HEAD(M)=THRE(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.48)HEAD(M)=UCH4F(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.49)HEAD(M)=UCO2S(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.50)HEAD(M)=WTSTGT(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      ENDIF
1026  CONTINUE
      WRITE(LUN,'(A16,F8.3,4X,A8,50E16.7E3)')OUTFILS(N-20,NY,NX)
     2,DOY,CDATE,(HEAD(K),K=1,M)
      ENDIF
      ENDIF
C
C     DAILY SOIL WATER OUTPUT
C
      IF(N.EQ.27)THEN
      IF(I.GE.IDATA(N).AND.I.LE.IDATA(N+20))THEN
      DO 1027 K=1,50
      IF(CHOICE(K,N-20).EQ.'YES')THEN
      M=M+1
      IF(K.EQ.1)HEAD(M)=1000.0*URAIN(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.2)HEAD(M)=1000.0*UEVAP(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.3)HEAD(M)=1000.0*URUN(NY,NX)/TAREA
      IF(K.EQ.4)HEAD(M)=1000.0*UVOLW(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.5)HEAD(M)=1000.0*UVOLO(NY,NX)/TAREA
      IF(K.EQ.6)HEAD(M)=1000.0*DPTHS(NY,NX)
      IF(K.EQ.7)HEAD(M)=THETWZ(1,NY,NX)
      IF(K.EQ.8)HEAD(M)=THETWZ(2,NY,NX)
      IF(K.EQ.9)HEAD(M)=THETWZ(3,NY,NX)
      IF(K.EQ.10)HEAD(M)=THETWZ(4,NY,NX)
      IF(K.EQ.11)HEAD(M)=THETWZ(5,NY,NX)
      IF(K.EQ.12)HEAD(M)=THETWZ(6,NY,NX)
      IF(K.EQ.13)HEAD(M)=THETWZ(7,NY,NX)
      IF(K.EQ.14)HEAD(M)=THETWZ(8,NY,NX)
      IF(K.EQ.15)HEAD(M)=THETWZ(9,NY,NX)
      IF(K.EQ.16)HEAD(M)=THETWZ(10,NY,NX)
      IF(K.EQ.17)HEAD(M)=THETWZ(11,NY,NX)
      IF(K.EQ.18)HEAD(M)=THETWZ(12,NY,NX)
      IF(K.EQ.19)HEAD(M)=THETWZ(13,NY,NX)
      IF(K.EQ.20)HEAD(M)=THETWZ(0,NY,NX)
      IF(K.EQ.21)HEAD(M)=THETIZ(1,NY,NX)
      IF(K.EQ.22)HEAD(M)=THETIZ(2,NY,NX)
      IF(K.EQ.23)HEAD(M)=THETIZ(3,NY,NX)
      IF(K.EQ.24)HEAD(M)=THETIZ(4,NY,NX)
      IF(K.EQ.25)HEAD(M)=THETIZ(5,NY,NX)
      IF(K.EQ.26)HEAD(M)=THETIZ(6,NY,NX)
      IF(K.EQ.27)HEAD(M)=THETIZ(7,NY,NX)
      IF(K.EQ.28)HEAD(M)=THETIZ(8,NY,NX)
      IF(K.EQ.29)HEAD(M)=THETIZ(9,NY,NX)
      IF(K.EQ.30)HEAD(M)=THETIZ(10,NY,NX)
      IF(K.EQ.31)HEAD(M)=THETIZ(11,NY,NX)
      IF(K.EQ.32)HEAD(M)=THETIZ(12,NY,NX)
      IF(K.EQ.33)HEAD(M)=THETIZ(13,NY,NX)
      IF(K.EQ.34)HEAD(M)=THETIZ(0,NY,NX)
      IF(K.EQ.35)HEAD(M)=PSISM(1,NY,NX)+PSISO(1,NY,NX)
      IF(K.EQ.36)HEAD(M)=PSISM(2,NY,NX)+PSISO(2,NY,NX)
      IF(K.EQ.37)HEAD(M)=PSISM(3,NY,NX)+PSISO(3,NY,NX)
      IF(K.EQ.38)HEAD(M)=PSISM(4,NY,NX)+PSISO(4,NY,NX)
      IF(K.EQ.39)HEAD(M)=PSISM(5,NY,NX)+PSISO(5,NY,NX)
      IF(K.EQ.40)HEAD(M)=PSISM(6,NY,NX)+PSISO(6,NY,NX)
      IF(K.EQ.41)HEAD(M)=PSISM(7,NY,NX)+PSISO(7,NY,NX)
      IF(K.EQ.42)HEAD(M)=PSISM(8,NY,NX)+PSISO(8,NY,NX)
      IF(K.EQ.43)HEAD(M)=PSISM(9,NY,NX)+PSISO(9,NY,NX)
      IF(K.EQ.44)HEAD(M)=PSISM(10,NY,NX)+PSISO(10,NY,NX)
      IF(K.EQ.45)HEAD(M)=PSISM(11,NY,NX)+PSISO(11,NY,NX)
      IF(K.EQ.46)HEAD(M)=PSISM(12,NY,NX)+PSISO(12,NY,NX)
      IF(K.EQ.47)HEAD(M)=PSISM(0,NY,NX)+PSISO(0,NY,NX)
      IF(K.EQ.48)HEAD(M)=-CDPTH(NU(NY,NX)-1,NY,NX)+0.0*DLYR(3,0,NY,NX)
      IF(K.EQ.49)HEAD(M)=-(DPTHA(NY,NX)-CDPTH(NU(NY,NX)-1,NY,NX))
      IF(K.EQ.50)HEAD(M)=-(DPTHT(NY,NX)-CDPTH(NU(NY,NX)-1,NY,NX))
      ENDIF
1027  CONTINUE
      WRITE(LUN,'(A16,F8.3,4X,A8,50E16.7E3)')OUTFILS(N-20,NY,NX)
     2,DOY,CDATE,(HEAD(K),K=1,M)
      ENDIF
      ENDIF
C
C     DAILY SOIL N OUTPUT
C
      IF(N.EQ.28)THEN
      IF(I.GE.IDATA(N).AND.I.LE.IDATA(N+20))THEN
      DO 1028 K=1,50
      IF(CHOICE(K,N-20).EQ.'YES')THEN
      M=M+1
      IF(K.EQ.1)HEAD(M)=URSDN(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.2)HEAD(M)=UORGN(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.3)HEAD(M)=UFERTN(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.4)HEAD(M)=UXZSN(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.5)HEAD(M)=UNH4(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.6)HEAD(M)=UNO3(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.7)HEAD(M)=UDONQ(NY,NX)/TAREA
      IF(K.EQ.8)HEAD(M)=UDOND(NY,NX)/TAREA
      IF(K.EQ.9)HEAD(M)=UDINQ(NY,NX)/TAREA
      IF(K.EQ.10)HEAD(M)=UDIND(NY,NX)/TAREA
      IF(K.EQ.11)HEAD(M)=UN2OG(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.12)HEAD(M)=UNH3G(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.13)HEAD(M)=UN2GS(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.14)HEAD(M)=TONT(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.15)THEN
      IF(BKVL(1,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(1,NY,NX)+ZNH4B(1,NY,NX)
     2+14.0*(XN4(1,NY,NX)+XNB(1,NY,NX)))/BKVL(1,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.16)THEN
      IF(BKVL(2,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(2,NY,NX)+ZNH4B(2,NY,NX)
     2+14.0*(XN4(2,NY,NX)+XNB(2,NY,NX)))/BKVL(2,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.17)THEN
      IF(BKVL(3,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(3,NY,NX)+ZNH4B(3,NY,NX)
     2+14.0*(XN4(3,NY,NX)+XNB(3,NY,NX)))/BKVL(3,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.18)THEN
      IF(BKVL(4,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(4,NY,NX)+ZNH4B(4,NY,NX)
     2+14.0*(XN4(4,NY,NX)+XNB(4,NY,NX)))/BKVL(4,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.19)THEN
      IF(BKVL(5,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(5,NY,NX)+ZNH4B(5,NY,NX)
     2+14.0*(XN4(5,NY,NX)+XNB(5,NY,NX)))/BKVL(5,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.20)THEN
      IF(BKVL(6,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(6,NY,NX)+ZNH4B(6,NY,NX)
     2+14.0*(XN4(6,NY,NX)+XNB(6,NY,NX)))/BKVL(6,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.21)THEN
      IF(BKVL(7,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(7,NY,NX)+ZNH4B(7,NY,NX)
     2+14.0*(XN4(7,NY,NX)+XNB(7,NY,NX)))/BKVL(7,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.22)THEN
      IF(BKVL(8,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(8,NY,NX)+ZNH4B(8,NY,NX)
     2+14.0*(XN4(8,NY,NX)+XNB(8,NY,NX)))/BKVL(8,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.23)THEN
      IF(BKVL(9,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(9,NY,NX)+ZNH4B(9,NY,NX)
     2+14.0*(XN4(9,NY,NX)+XNB(9,NY,NX)))/BKVL(9,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.24)THEN
      IF(BKVL(10,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(10,NY,NX)+ZNH4B(10,NY,NX)
     2+14.0*(XN4(10,NY,NX)+XNB(10,NY,NX)))/BKVL(10,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.25)THEN
      IF(BKVL(11,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(11,NY,NX)+ZNH4B(11,NY,NX)
     2+14.0*(XN4(11,NY,NX)+XNB(11,NY,NX)))/BKVL(11,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.26)THEN
      IF(BKVL(12,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(12,NY,NX)+ZNH4B(12,NY,NX)
     2+14.0*(XN4(12,NY,NX)+XNB(12,NY,NX)))/BKVL(12,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.27)THEN
      IF(BKVL(13,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(13,NY,NX)+ZNH4B(13,NY,NX)
     2+14.0*(XN4(13,NY,NX)+XNB(13,NY,NX)))/BKVL(13,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.28)THEN
      IF(BKVL(14,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(14,NY,NX)+ZNH4B(14,NY,NX)
     2+14.0*(XN4(14,NY,NX)+XNB(14,NY,NX)))/BKVL(14,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.29)THEN
      IF(BKVL(15,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(15,NY,NX)+ZNH4B(15,NY,NX)
     2+14.0*(XN4(15,NY,NX)+XNB(15,NY,NX)))/BKVL(15,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.30)THEN
      IF(BKVL(1,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(1,NY,NX)+ZNO3B(1,NY,NX)
     2+ZNO2S(1,NY,NX)+ZNO2B(1,NY,NX))/BKVL(1,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.31)THEN
      IF(BKVL(2,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(2,NY,NX)+ZNO3B(2,NY,NX)
     2+ZNO2S(2,NY,NX)+ZNO2B(2,NY,NX))/BKVL(2,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.32)THEN
      IF(BKVL(3,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(3,NY,NX)+ZNO3B(3,NY,NX)
     3+ZNO2S(3,NY,NX)+ZNO2B(3,NY,NX))/BKVL(3,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.33)THEN
      IF(BKVL(4,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(4,NY,NX)+ZNO3B(4,NY,NX)
     2+ZNO2S(4,NY,NX)+ZNO2B(4,NY,NX))/BKVL(4,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.34)THEN
      IF(BKVL(5,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(5,NY,NX)+ZNO3B(5,NY,NX)
     2+ZNO2S(5,NY,NX)+ZNO2B(5,NY,NX))/BKVL(5,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.35)THEN
      IF(BKVL(6,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(6,NY,NX)+ZNO3B(6,NY,NX)
     2+ZNO2S(6,NY,NX)+ZNO2B(6,NY,NX))/BKVL(6,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.36)THEN
      IF(BKVL(7,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(7,NY,NX)+ZNO3B(7,NY,NX)
     2+ZNO2S(7,NY,NX)+ZNO2B(7,NY,NX))/BKVL(7,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.37)THEN
      IF(BKVL(8,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(8,NY,NX)+ZNO3B(8,NY,NX)
     2+ZNO2S(8,NY,NX)+ZNO2B(8,NY,NX))/BKVL(8,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.38)THEN
      IF(BKVL(9,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(9,NY,NX)+ZNO3B(9,NY,NX)
     2+ZNO2S(9,NY,NX)+ZNO2B(9,NY,NX))/BKVL(9,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.39)THEN
      IF(BKVL(10,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(10,NY,NX)+ZNO3B(10,NY,NX)
     2+ZNO2S(10,NY,NX)+ZNO2B(10,NY,NX))/BKVL(10,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.40)THEN
      IF(BKVL(11,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(11,NY,NX)+ZNO3B(11,NY,NX)
     2+ZNO2S(11,NY,NX)+ZNO2B(11,NY,NX))/BKVL(11,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.41)THEN
      IF(BKVL(12,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(12,NY,NX)+ZNO3B(12,NY,NX)
     2+ZNO2S(12,NY,NX)+ZNO2B(12,NY,NX))/BKVL(12,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.42)THEN
      IF(BKVL(13,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(13,NY,NX)+ZNO3B(13,NY,NX)
     2+ZNO2S(13,NY,NX)+ZNO2B(13,NY,NX))/BKVL(13,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.43)THEN
      IF(BKVL(14,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(14,NY,NX)+ZNO3B(14,NY,NX)
     2+ZNO2S(14,NY,NX)+ZNO2B(14,NY,NX))/BKVL(14,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.44)THEN
      IF(BKVL(15,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(15,NY,NX)+ZNO3B(15,NY,NX)
     2+ZNO2S(15,NY,NX)+ZNO2B(15,NY,NX))/BKVL(15,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.45)THEN
      IF(BKVL(0,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNH4S(0,NY,NX) 
     2+14.0*XN4(0,NY,NX))/BKVL(0,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.46)THEN
      IF(BKVL(0,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(ZNO3S(0,NY,NX) 
     2+ZNO2S(0,NY,NX))/BKVL(0,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.47)HEAD(M)=XHVSTN(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.48)HEAD(M)=-TRINH4(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.49)HEAD(M)=UNH3F(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.50)HEAD(M)=UN2GG(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      ENDIF
1028  CONTINUE
      WRITE(LUN,'(A16,F8.3,4X,A8,50E16.7E3)')OUTFILS(N-20,NY,NX)
     2,DOY,CDATE,(HEAD(K),K=1,M)
      ENDIF
      ENDIF
C
C     DAILY SOIL P OUTPUT
C
      IF(N.EQ.29)THEN
      IF(I.GE.IDATA(N).AND.I.LE.IDATA(N+20))THEN
      DO 1029 K=1,50
      IF(CHOICE(K,N-20).EQ.'YES')THEN
      M=M+1
      IF(K.EQ.1)HEAD(M)=URSDP(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.2)HEAD(M)=UORGP(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.3)HEAD(M)=UFERTP(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.4)HEAD(M)=UXPSN(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.5)HEAD(M)=UPO4(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.6)HEAD(M)=UDOPQ(NY,NX)/TAREA
      IF(K.EQ.7)HEAD(M)=UDOPD(NY,NX)/TAREA
      IF(K.EQ.8)HEAD(M)=UDIPQ(NY,NX)/TAREA
      IF(K.EQ.9)HEAD(M)=UDIPD(NY,NX)/TAREA
      IF(K.EQ.10)HEAD(M)=UPP4(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.11)HEAD(M)=TOPT(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.12)HEAD(M)=UPO4F(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.13)THEN
      IF(BKVL(1,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(H1PO4(1,NY,NX)+H1POB(1,NY,NX)
     2+H2PO4(1,NY,NX)+H2POB(1,NY,NX))/VOLW(1,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.14)THEN
      IF(BKVL(2,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(H1PO4(2,NY,NX)+H2POB(1,NY,NX)
     2+H2PO4(2,NY,NX)+H2POB(2,NY,NX))/VOLW(2,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.15)THEN
      IF(BKVL(3,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(H1PO4(3,NY,NX)+H1POB(3,NY,NX)
     2+H2PO4(3,NY,NX)+H2POB(3,NY,NX))/VOLW(3,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.16)THEN
      IF(BKVL(4,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(H1PO4(4,NY,NX)+H1POB(4,NY,NX)
     2+H2PO4(4,NY,NX)+H2POB(4,NY,NX))/VOLW(4,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.17)THEN
      IF(BKVL(5,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(H1PO4(5,NY,NX)+H1POB(5,NY,NX)
     2+H2PO4(5,NY,NX)+H2POB(5,NY,NX))/VOLW(5,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.18)THEN
      IF(BKVL(6,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(H1PO4(6,NY,NX)+H1POB(6,NY,NX)
     2+H2PO4(6,NY,NX)+H2POB(6,NY,NX))/VOLW(6,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.19)THEN
      IF(BKVL(7,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(H1PO4(7,NY,NX)+H1POB(7,NY,NX)
     2+H2PO4(7,NY,NX)+H2POB(7,NY,NX))/VOLW(7,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.20)THEN
      IF(BKVL(8,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(H1PO4(8,NY,NX)+H1POB(8,NY,NX)
     2+H2PO4(8,NY,NX)+H2POB(8,NY,NX))/VOLW(8,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.21)THEN
      IF(BKVL(9,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(H1PO4(9,NY,NX)+H1POB(9,NY,NX)
     2+H2PO4(9,NY,NX)+H2POB(9,NY,NX))/VOLW(9,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.22)THEN
      IF(BKVL(10,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(H1PO4(10,NY,NX)+H1POB(10,NY,NX)
     2+H2PO4(10,NY,NX)+H2POB(10,NY,NX))/VOLW(10,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.23)THEN
      IF(BKVL(11,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(H1PO4(11,NY,NX)+H1POB(11,NY,NX)
     2+H2PO4(11,NY,NX)+H2POB(11,NY,NX))/VOLW(11,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.24)THEN
      IF(BKVL(12,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(H1PO4(12,NY,NX)+H1POB(1,NY,NX)
     2+H2PO4(12,NY,NX)+H2POB(12,NY,NX))/VOLW(12,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.25)THEN
      IF(BKVL(13,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(H1PO4(13,NY,NX)+H1POB(13,NY,NX)
     2+H2PO4(13,NY,NX)+H2POB(13,NY,NX))/VOLW(13,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.26)THEN
      IF(BKVL(14,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(H1PO4(14,NY,NX)+H1POB(14,NY,NX)
     2+H2PO4(14,NY,NX)+H2POB(14,NY,NX))/VOLW(14,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.27)THEN
      IF(BKVL(15,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=(H1PO4(15,NY,NX)+H1POB(15,NY,NX)
     2+H2PO4(15,NY,NX)+H2POB(15,NY,NX))/VOLW(15,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.28)THEN
      IF(BKVL(1,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(1,NY,NX)+XH2P(1,NY,NX)
     2+XH1PB(1,NY,NX)+XH2PB(1,NY,NX))/BKVL(1,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.29)THEN
      IF(BKVL(2,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(2,NY,NX)+XH2P(2,NY,NX)
     2+XH1PB(2,NY,NX)+XH2PB(2,NY,NX))/BKVL(2,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.30)THEN
      IF(BKVL(3,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(3,NY,NX)+XH2P(3,NY,NX)
     2+XH1PB(3,NY,NX)+XH2PB(3,NY,NX))/BKVL(3,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.31)THEN
      IF(BKVL(4,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(4,NY,NX)+XH2P(4,NY,NX)
     2+XH1PB(4,NY,NX)+XH2PB(4,NY,NX))/BKVL(4,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.32)THEN
      IF(BKVL(5,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(5,NY,NX)+XH2P(5,NY,NX)
     2+XH1PB(5,NY,NX)+XH2PB(5,NY,NX))/BKVL(5,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.33)THEN
      IF(BKVL(6,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(6,NY,NX)+XH2P(6,NY,NX)
     2+XH1PB(6,NY,NX)+XH2PB(6,NY,NX))/BKVL(6,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.34)THEN
      IF(BKVL(7,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(7,NY,NX)+XH2P(7,NY,NX)
     2+XH1PB(7,NY,NX)+XH2PB(7,NY,NX))/BKVL(7,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.35)THEN
      IF(BKVL(8,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(8,NY,NX)+XH2P(8,NY,NX)
     2+XH1PB(8,NY,NX)+XH2PB(8,NY,NX))/BKVL(8,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.36)THEN
      IF(BKVL(9,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(9,NY,NX)+XH2P(9,NY,NX)
     2+XH1PB(9,NY,NX)+XH2PB(9,NY,NX))/BKVL(9,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.37)THEN
      IF(BKVL(10,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(10,NY,NX)+XH2P(10,NY,NX)
     2+XH1PB(10,NY,NX)+XH2PB(10,NY,NX))/BKVL(10,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.38)THEN
      IF(BKVL(11,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(11,NY,NX)+XH2P(11,NY,NX)
     2+XH1PB(11,NY,NX)+XH2PB(11,NY,NX))/BKVL(11,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.39)THEN
      IF(BKVL(12,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(12,NY,NX)+XH2P(12,NY,NX)
     2+XH1PB(12,NY,NX)+XH2PB(12,NY,NX))/BKVL(12,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.40)THEN
      IF(BKVL(13,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(13,NY,NX)+XH2P(13,NY,NX)
     2+XH1PB(13,NY,NX)+XH2PB(13,NY,NX))/BKVL(13,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.41)THEN
      IF(BKVL(14,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(14,NY,NX)+XH2P(14,NY,NX)
     2+XH1PB(14,NY,NX)+XH2PB(14,NY,NX))/BKVL(14,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.42)THEN
      IF(BKVL(15,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(15,NY,NX)+XH2P(15,NY,NX)
     2+XH1PB(15,NY,NX)+XH2PB(15,NY,NX))/BKVL(15,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.43)THEN
      IF(BKVL(0,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=H2PO4(0,NY,NX)/BKVL(0,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.44)THEN
      IF(BKVL(0,NY,NX).GT.ZEROS(NY,NX))THEN 
      HEAD(M)=31.0*(XH1P(0,NY,NX)+XH2P(0,NY,NX))/BKVL(0,NY,NX)
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.47)HEAD(M)=XHVSTP(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.48)HEAD(M)=-TRIPO4(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      ENDIF
1029  CONTINUE
      WRITE(LUN,'(A16,F8.3,4X,A8,50E16.7E3)')OUTFILS(N-20,NY,NX)
     2,DOY,CDATE,(HEAD(K),K=1,M)
      ENDIF
      ENDIF
C
C     DAILY SOIL HEAT OUTPUT
C
      IF(N.EQ.30)THEN
      IF(I.GE.IDATA(N).AND.I.LE.IDATA(N+20))THEN
      DO 1030 K=1,50
      IF(CHOICE(K,N-20).EQ.'YES')THEN
      M=M+1
      IF(K.EQ.1)HEAD(M)=TRAD(NY,NX)
      IF(K.EQ.2)HEAD(M)=TAMX(NY,NX)
      IF(K.EQ.3)HEAD(M)=TAMN(NY,NX)
      IF(K.EQ.4)HEAD(M)=HUDX(NY,NX)
      IF(K.EQ.5)HEAD(M)=HUDN(NY,NX)
      IF(K.EQ.6)HEAD(M)=TWIND(NY,NX)*0.001
      IF(K.EQ.7)HEAD(M)=TRAI(NY,NX)
      IF(K.EQ.8)HEAD(M)=TSMX(1,NY,NX)
      IF(K.EQ.9)HEAD(M)=TSMN(1,NY,NX)
      IF(K.EQ.10)HEAD(M)=TSMX(2,NY,NX)
      IF(K.EQ.11)HEAD(M)=TSMN(2,NY,NX)
      IF(K.EQ.12)HEAD(M)=TSMX(3,NY,NX)
      IF(K.EQ.13)HEAD(M)=TSMN(3,NY,NX)
      IF(K.EQ.14)HEAD(M)=TSMX(4,NY,NX)
      IF(K.EQ.15)HEAD(M)=TSMN(4,NY,NX)
      IF(K.EQ.16)HEAD(M)=TSMX(5,NY,NX)
      IF(K.EQ.17)HEAD(M)=TSMN(5,NY,NX)
      IF(K.EQ.18)HEAD(M)=TSMX(6,NY,NX)
      IF(K.EQ.19)HEAD(M)=TSMN(6,NY,NX)
      IF(K.EQ.20)HEAD(M)=TSMX(7,NY,NX)
      IF(K.EQ.21)HEAD(M)=TSMN(7,NY,NX)
      IF(K.EQ.22)HEAD(M)=TSMX(8,NY,NX)
      IF(K.EQ.23)HEAD(M)=TSMN(8,NY,NX)
      IF(K.EQ.24)HEAD(M)=TSMX(9,NY,NX)
      IF(K.EQ.25)HEAD(M)=TSMN(9,NY,NX)
      IF(K.EQ.26)HEAD(M)=TSMX(10,NY,NX)
      IF(K.EQ.27)HEAD(M)=TSMN(10,NY,NX)
      IF(K.EQ.28)HEAD(M)=TSMX(11,NY,NX)
      IF(K.EQ.29)HEAD(M)=TSMN(11,NY,NX)
      IF(K.EQ.30)HEAD(M)=TSMX(12,NY,NX)
      IF(K.EQ.31)HEAD(M)=TSMN(12,NY,NX)
      IF(K.EQ.32)HEAD(M)=TSMX(13,NY,NX)
      IF(K.EQ.33)HEAD(M)=TSMN(13,NY,NX)
      IF(K.EQ.34)HEAD(M)=TSMX(14,NY,NX)
      IF(K.EQ.35)HEAD(M)=TSMN(14,NY,NX)
      IF(K.EQ.36)HEAD(M)=TSMX(0,NY,NX)
      IF(K.EQ.37)HEAD(M)=TSMN(0,NY,NX)
      IF(K.EQ.38)HEAD(M)=ECND(1,NY,NX)
      IF(K.EQ.39)HEAD(M)=ECND(2,NY,NX)
      IF(K.EQ.40)HEAD(M)=ECND(3,NY,NX)
      IF(K.EQ.41)HEAD(M)=ECND(4,NY,NX)
      IF(K.EQ.42)HEAD(M)=ECND(5,NY,NX)
      IF(K.EQ.43)HEAD(M)=ECND(6,NY,NX)
      IF(K.EQ.44)HEAD(M)=ECND(7,NY,NX)
      IF(K.EQ.45)HEAD(M)=ECND(8,NY,NX)
      IF(K.EQ.46)HEAD(M)=ECND(9,NY,NX)
      IF(K.EQ.47)HEAD(M)=ECND(10,NY,NX)
      IF(K.EQ.48)HEAD(M)=ECND(11,NY,NX)
      IF(K.EQ.49)HEAD(M)=ECND(12,NY,NX)
C     IF(K.EQ.50)HEAD(M)=ECND(13,NY,NX)
      IF(K.EQ.50)HEAD(M)=UIONOU(NY,NX)/TAREA
      ENDIF
1030  CONTINUE
      WRITE(LUN,'(A16,F8.3,4X,A8,50E16.7E3)')OUTFILS(N-20,NY,NX)
     2,DOY,CDATE,(HEAD(K),K=1,M)
      ENDIF
      ENDIF
9990  CONTINUE
9995  CONTINUE
      ENDIF
1040  CONTINUE
      RETURN
      END
