@echo off 
cd /d "%~dp0"
setlocal EnableDelayedExpansion

if exist "sys.txt" (
    powershell rm sys.txt
) else goto loop




:loop 


for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do set ip=%%a

rem windows

for /f "tokens=2 delims==" %%v in ('wmic os get version /value ^| find "Version"') do set version=%%v
for /f "tokens=2 delims==" %%a in ('wmic os get caption /value ^| find "Caption"') do set caption=%%a 
for /f "tokens=2 delims==" %%a in ('wmic os get installdate /value ^| find "InstallDate"') do set inss=%%a

rem cpu

for /f "tokens=2 delims==" %%a in ('wmic cpu get caption /value ^| find "Caption"') do set cpuc=%%a
for /f "tokens=2 delims==" %%a in ('wmic cpu get NumberOfCores /value ^| find "NumberOfCores"') do set coren=%%a
for /f "tokens=2 delims==" %%a in ('wmic cpu get NumberOfLogicalProcessors /value ^| find "NumberOfLogicalProcessors"') do set logp=%%a 
for /f "tokens=2 delims==" %%a in ('wmic cpu get maxclockspeed /value ^| find "MaxClockSpeed"') do set speed=%%a
for /f "tokens=2 delims==" %%a in ('wmic cpu get loadpercentage /value ^| find "LoadPercentage"') do set load=%%a 

rem gpu

for /f "tokens=2 delims==" %%a in ('wmic path win32_videocontroller get caption /value ^| find "Caption"') do set gpuc=%%a 
for /f "tokens=2 delims==" %%a in ('wmic path win32_videocontroller get deviceid /value ^| find "DeviceID"') do set devid=%%a 
for /f "tokens=2 delims==" %%a in ('wmic path win32_videocontroller get driverversion /value ^| find "DriverVersion"') do set drv=%%a 


rem architecture
for /f "tokens=2 delims==" %%o in ('wmic os get /value ^| find "OSArchitecture"') do set opsi=%%o 

rem motherboard 

for /f "tokens=2 delims==" %%a in ('wmic baseboard get manufacturer /value ^| find "Manufacturer"') do set base=%%a 
for /f "tokens=2 delims==" %%a in ('wmic baseboard get product /value ^| find "Product"') do set produ=%%a 
for /f "tokens=2 delims==" %%a in ('wmic baseboard get version /value ^| find "Version"') do set ver=%%a 
for /f "tokens=2 delims==" %%a in ('wmic baseboard get serialnumber /value ^| find "SerialNumber"') do set serr=%%a 

rem ram 

for /f "tokens=2 delims==" %%a in ('wmic memorychip get capacity /value ^| find "Capacity"') do set mmc=%%a 
for /f "tokens=2 delims==" %%a in ('wmic memorychip get speed /value ^| find "Speed"') do set mms=%%a  
for /f "tokens=2 delims==" %%a in ('wmic memorychip get manufacturer /value ^| find "Manufacturer"') do set mmm=%%a 
for /f "tokens=2 delims==" %%a in ('wmic memorychip get PartNumber /value ^| find "PartNumber"') do set mmp=%%a



rem bios 

for /f "tokens=2 delims==" %%a in ('wmic bios get SMBIOSBIOSVersion /value ^| find "SMBIOSBIOSVersion"') do set versi=%%a 
for /f "tokens=2 delims==" %%a in ('wmic bios get releasedate /value ^| find "ReleaseDate"') do set rell=%%a 
for /f "tokens=2 delims==" %%a in ('wmic bios get manufacturer /value ^| find "Manufacturer"') do set manu=%%a 

rem diskdrive 

for /f "tokens=2 delims==" %%a in ('wmic diskdrive get model /value ^| find "Model"') do set ddm=%%a 
for /f "tokens=2 delims==" %%a in ('wmic diskdrive get size /value ^| find "Size"') do set dds=%%a 
for /f "tokens=2 delims==" %%a in ('wmic diskdrive get MediaType /value ^| find "MediaType"') do set ddd=%%a


for /f "tokens=3 delims= " %%a in ('net stats workstation ^| find "Statistics since"') do set ssd=%%a 
for /f "tokens=4 delims= " %%a in ('net stats workstation ^| find "Statistics since"') do set sst=%%a 
 






echo ComputerName: %COMPUTERNAME% > sys.txt
echo. >> sys.txt
echo UserName: %USERNAME% >> sys.txt 
echo. >> sys.txt
echo WindowsVersion: %caption% >> sys.txt 
echo. >> sys.txt
echo BuildVersion: %version% >> sys.txt
echo. >> sys.txt
echo InstallDate: %inss% >> sys.txt
echo. >> sys.txt
echo SystemArchitecture: %opsi% >> sys.txt 
echo. >> sys.txt
echo CPU: %cpuc% >> sys.txt
echo. >> sys.txt
echo NumberOfCores: %coren% >> sys.txt
echo. >> sys.txt
echo NumberOfLogicalProcessors: %logp% >> sys.txt
echo. >> sys.txt
echo MaxClockSpeed: %speed% >> sys.txt 
echo. >> sys.txt
echo CurrentCPULoad: %load% >> sys.txt
echo. >> sys.txt
echo GPU: %gpuc% >> sys.txt 
echo. >> sys.txt
echo DeviceID: %devid% >> sys.txt
echo. >> sys.txt
echo DriverVersion: %drv% >> sys.txt
echo. >> sys.txt
echo RAM: %mmc% >> sys.txt
echo. >> sys.txt
echo Speed: %mms% >> sys.txt 
echo. >> sys.txt
echo RAMManufacturer: %mmm% >> sys.txt 
echo. >> sys.txt
echo PartNumber: %mmp% >> sys.txt
echo. >> sys.txt
echo MotherBoardManufacturer: %base% >> sys.txt
echo. >> sys.txt
echo MotherBoardProduct: %produ% >> sys.txt
echo. >> sys.txt
echo MotherBoardVersion: %version% >> sys.txt 
echo. >> sys.txt
echo MotherBoardSerialNo: %serr% >> sys.txt
echo. >> sys.txt
echo BIOSManufacturer: %manu% >> sys.txt 
echo. >> sys.txt
echo ReleaseDate: %rell% >> sys.txt 
echo. >> sys.txt
echo BIOSVersion: %versi% >> sys.txt 
echo. >> sys.txt
echo DiskType: %ddd% >> sys.txt 
echo. >> sys.txt
echo DiskModel: %ddm% >> sys.txt 
echo. >> sys.txt
echo DiskSize: %dds% >> sys.txt 
echo. >> sys.txt
echo CurrentIP: %ip% >> sys.txt 
echo. >> sys.txt
echo CurrentDate: %DATE% >> sys.txt 
echo. >> sys.txt
echo CurrentTime: %TIME% >> sys.txt 
echo. >> sys.txt 
echo LastPowerOn: %ssd% %sst% >> sys.txt
echo. >> sys.txt

echo.
echo Your data is saved to sys.txt 
echo.
echo In %CD%
echo.
echo Note: If you run this file again
echo.
echo That data will be replaced with a new one 
echo.

python data.py 
