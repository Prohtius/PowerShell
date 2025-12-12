# Microsoft Server

[W32Time Fixup](#w32time-fixup)

## W32Time Fixup
Fix issues with Microsoft Server not properly syncing time

```powershell
net stop w32time
net stop w32time
w32tm  /unregister
w32tm /register
w32tm /config /manualpeerlist:"time.windows.com,0x8 pool.ntp.org,0x8" /reliable:yes /syncfromflags:manual
net start w32time
w32tm /resync /nowait
w32tm /query /status
w32tm /query /peers
```
