@ECHO off
ECHO *                       GOOGLE DNS
CALL:IP 	8.8.8.8		
ECHO * 	8.8.8.8				%ms%
CALL:IP 	8.8.4.4		
ECHO * 	8.8.4.4				%ms%
ECHO *
ECHO *
ECHO *                       CLOUDFLARE
CALL:IP 	1.1.1.1		
ECHO * 	1.1.1.1				%ms%
CALL:IP 	1.0.0.1		
ECHO * 	1.0.0.1				%ms%
ECHO *                 Malware Blocking Only
CALL:IP 	1.1.1.2		
ECHO * 	1.1.1.2				%ms%
CALL:IP 	1.0.0.2		
ECHO * 	1.0.0.2				%ms%
ECHO *    Malware and Adult Content Blocking Together
CALL:IP 	1.1.1.3		
ECHO * 	1.1.1.3				%ms%
CALL:IP 	1.0.0.3		
ECHO * 	1.0.0.3				%ms%
ECHO *
ECHO *
ECHO *                        QUAD 9
CALL:IP 	9.9.9.9		
ECHO * 	9.9.9.9				%ms%
CALL:IP 	149.112.112.112		
ECHO * 	149.112.112.112			%ms%
ECHO *Secured w/ECS: Malware blocking, DNSSEC Validation
CALL:IP 	9.9.9.11		
ECHO * 	9.9.9.11			%ms%
CALL:IP 	149.112.112.11		
ECHO * 	149.112.112.11			%ms%
ECHO *Unsecured: No Malware blocking, no DNSSEC validation
CALL:IP 	9.9.9.10		
ECHO * 	9.9.9.10			%ms%
CALL:IP 	149.112.112.10		
ECHO * 	149.112.112.10			%ms%
ECHO *
ECHO *
ECHO *                       OpenDNS
CALL:IP 	208.67.222.222		
ECHO * 	208.67.222.222			%ms%
CALL:IP 	208.67.220.220		
ECHO * 	208.67.220.220			%ms%
ECHO *                      FamilyShield
CALL:IP 	208.67.222.123		
ECHO * 	208.67.222.123			%ms%
CALL:IP 	208.67.220.123		
ECHO * 	208.67.220.123			%ms%



ECHO *
ECHO *
ECHO *             AdGuard DNS Default servers
CALL:IP 	94.140.14.14		
ECHO * 	94.140.14.14			%ms%
CALL:IP 	94.140.15.15		
ECHO * 	94.140.15.15			%ms%
ECHO *                 Non-filtering servers
CALL:IP 	94.140.14.140		
ECHO * 	94.140.14.140			%ms%
CALL:IP 	94.140.14.141		
ECHO * 	94.140.14.141			%ms%
ECHO *                Family protection
CALL:IP 	94.140.14.15		
ECHO * 	94.140.14.15			%ms%
CALL:IP 	94.140.15.16		
ECHO * 	94.140.15.16			%ms%
ECHO *
ECHO *
ECHO *                         Yandex DNS
CALL:IP 	77.88.8.1		
ECHO * 	77.88.8.1			%ms%
CALL:IP 	77.88.8.8		
ECHO * 	77.88.8.8			%ms%
ECHO *
ECHO *
ECHO ********************* Test Done! *********************
ECHO.
ECHO.
  
 ECHO.&PAUSE&GOTO:EOF
 
PAUSE
:IP
SET ms= ******  RTO ******
FOR /F "tokens=4 delims==" %%i IN ('ping.exe -n 1 %1 ^| FIND "ms"') DO SET ms=%%i
GOTO:EOF
