for %i IN (dir /b *.dll) DO (regsvr32 /i /s %i)
cd %windir%\syswow64
for %i IN (dir /b *.dll) DO (regsvr32 /i /s %i)
sc config wuauserv start= auto
sc config bits start= auto
sc config cryptsvc start= auto
sc config trustedinstaller start= auto
net stop wuauserv
net stop bits
ren %systemroot%\System32\Spupdsvc.exe Spupdsvc.old
cd %windir%
Ren SoftwareDistribution SoftwareDistribution.old
dism /online /cleanup-image /restorehealth