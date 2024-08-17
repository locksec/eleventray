[Setup]
AppName=ElevenTray
AppVersion=1.0.2
AppVerName=ElevenTray
DefaultDirName={commonpf64}\ElevenTray
DefaultGroupName=ElevenTray
OutputBaseFilename=elevensetup
ArchitecturesInstallIn64BitMode=x64compatible
Compression=lzma
SolidCompression=yes
MinVersion=10.0.22000
OutputDir=installer
LicenseFile=LICENSE.txt
PrivilegesRequired=admin 

[Files]
Source: "build\ElevenTray.exe"; DestDir: "{app}"; Flags: ignoreversion

[Run]
Filename: "{cmd}"; Parameters: "/C schtasks /create /tn ""ElevenTray"" /tr ""\""{app}\ElevenTray.exe\"""" /sc onlogon /rl highest /f"; Flags: runhidden
Filename: "{app}\ElevenTray.exe"; Description: "Start ElevenTray"; Flags: shellexec skipifsilent

[UninstallRun]
Filename: "taskkill"; Parameters: "/F /IM ElevenTray.exe"; Flags: runhidden; RunOnceId: "TerminateElevenTray"
Filename: "{cmd}"; Parameters: "/C schtasks /delete /tn ""ElevenTray"" /f"; Flags: runhidden; RunOnceId: "DeleteElevenTrayTask"

[UninstallDelete]
Type: filesandordirs; Name: "{app}"
