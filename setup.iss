[Setup]
AppName=ElevenTray
AppVersion=1.0
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

[Files]
Source: "build\ElevenTray.exe"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{commonstartup}\ElevenTray"; Filename: "{app}\ElevenTray.exe"; WorkingDir: "{app}"

[Run]
Filename: "{app}\ElevenTray.exe"; Description: "Start ElevenTray"; Flags: shellexec skipifsilent

[UninstallRun]
; Terminate the ElevenTray process during uninstallation
Filename: "taskkill"; Parameters: "/F /IM ElevenTray.exe"; Flags: runhidden; RunOnceId: "TerminateElevenTray"

[UninstallDelete]
; Ensure that the entire installation directory is removed
Type: filesandordirs; Name: "{app}"
