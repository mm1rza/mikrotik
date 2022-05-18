@ECHO off
CALL:IP 	8.8.8.8		
ECHO * 	8.8.8.8				%ms%
CALL:IP 	8.8.4.4		
ECHO * 	8.8.4.4				%ms%
CALL:IP 	1.1.1.1		
ECHO * 	1.1.1.1				%ms%
CALL:IP 	1.0.0.1		
ECHO * 	1.0.0.1				%ms%
CALL:IP 	9.9.9.9		
ECHO * 	9.9.9.9				%ms%
CALL:IP 	9.9.9.10		
ECHO * 	9.9.9.10			%ms%
CALL:IP 	208.67.220.220		
ECHO * 	208.67.220.220			%ms%
CALL:IP 	208.67.222.222		
ECHO * 	208.67.222.222			%ms%
CALL:IP 	8.20.247.20		
ECHO * 	8.20.247.20			%ms%
CALL:IP 	8.26.56.26		
ECHO * 	8.26.56.26			%ms%
CALL:IP 	37.235.1.177		
ECHO * 	37.235.1.177			%ms%
CALL:IP 	45.32.36.36		
ECHO * 	45.32.36.36			%ms%
CALL:IP 	45.33.97.5		
ECHO * 	45.33.97.5			%ms%
CALL:IP 	45.77.165.194		
ECHO * 	45.77.165.194			%ms%
CALL:IP 	64.6.64.6		
ECHO * 	64.6.64.6			%ms%
CALL:IP 	64.6.65.6		
ECHO * 	64.6.65.6			%ms%
CALL:IP 	74.82.42.42		
ECHO * 	74.82.42.42			%ms%
CALL:IP 	76.76.2.0		
ECHO * 	76.76.2.0			%ms%
CALL:IP 	76.76.10.0		
ECHO * 	76.76.10.0			%ms%
CALL:IP 	76.76.19.19		
ECHO * 	76.76.19.19			%ms%
CALL:IP 	76.223.122.150		
ECHO * 	76.223.122.150			%ms%
CALL:IP 	77.88.8.1		
ECHO * 	77.88.8.1			%ms%
CALL:IP 	77.88.8.8		
ECHO * 	77.88.8.8			%ms%
CALL:IP 	84.200.69.80		
ECHO * 	84.200.69.80			%ms%
CALL:IP 	84.200.70.40		
ECHO * 	84.200.70.40			%ms%
CALL:IP 	89.233.43.71		
ECHO * 	89.233.43.71			%ms%
CALL:IP 	91.239.100.100		
ECHO * 	91.239.100.100			%ms%
CALL:IP 	134.195.4.2		
ECHO * 	134.195.4.2			%ms%
CALL:IP 	149.112.112.112		
ECHO * 	149.112.112.112			%ms%
CALL:IP 	159.89.120.99		
ECHO * 	159.89.120.99			%ms%
CALL:IP 	185.228.168.9		
ECHO * 	185.228.168.9			%ms%
CALL:IP 	185.228.169.9		
ECHO * 	185.228.169.9			%ms%
CALL:IP 	195.46.39.39		
ECHO * 	195.46.39.39			%ms%
CALL:IP 	195.46.39.40		
ECHO * 	195.46.39.40			%ms%
CALL:IP 	205.171.2.65		
ECHO * 	205.171.2.65			%ms%
CALL:IP 	205.171.3.65		
ECHO * 	205.171.3.65			%ms%
CALL:IP 	216.146.35.35		
ECHO * 	216.146.35.35			%ms%
CALL:IP 	216.146.36.36		
ECHO * 	216.146.36.36			%ms%
CALL:IP 	43.229.254.6		
ECHO * 	43.229.254.6			%ms%
CALL:IP 	94.140.14.140		
ECHO * 	94.140.14.140			%ms%
CALL:IP 	208.67.222.123		
ECHO * 	208.67.222.123			%ms%
CALL:IP 	94.140.14.15		
ECHO * 	94.140.14.15			%ms%
CALL:IP 	4.2.2.1		
ECHO * 	4.2.2.1				%ms%
CALL:IP 	4.2.2.2		
ECHO * 	4.2.2.2				%ms%
CALL:IP 	4.2.2.3		
ECHO * 	4.2.2.3				%ms%
CALL:IP 	4.2.2.4		
ECHO * 	4.2.2.4				%ms%
CALL:IP 	4.2.2.5		
ECHO * 	4.2.2.5				%ms%
CALL:IP 	4.2.2.6		
ECHO * 	4.2.2.6				%ms%

ECHO ********************* Test Done! *********************
ECHO.
ECHO.
  
ECHO.&PAUSE&GOTO:EOF
 
:IP
SET ms= ******  RTO ******
FOR /F "tokens=4 delims==" %%i IN ('ping.exe -n 1 %1 ^| FIND "ms"') DO SET ms=%%i
GOTO:EOF
