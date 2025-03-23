!include "..\..\includes\standard.nsh"

Name "GTA Vice City - Next Gen Edition"
InstallDir "C:\MulderLoad\GTA Vice City - Next Gen Edition"

Section "GTA Vice City - Next Gen Edition v1.1"
    SetOutPath $INSTDIR

    !insertmacro Download https://archive.org/download/grand-theft-auto-vice-city-next-gen-edition/GTAVCNE.EN.RU.Repack/vcNE_setup.exe vcNE_setup.exe
    !insertmacro Download https://archive.org/download/grand-theft-auto-vice-city-next-gen-edition/GTAVCNE.EN.RU.Repack/vcNE_setup-1.bin vcNE_setup-1.bin
    !insertmacro Download https://archive.org/download/grand-theft-auto-vice-city-next-gen-edition/GTAVCNE.EN.RU.Repack/vcNE_setup-2.bin vcNE_setup-2.bin
    !insertmacro Download https://archive.org/download/grand-theft-auto-vice-city-next-gen-edition/GTAVCNE.EN.RU.Repack/vcNE_setup-3.bin vcNE_setup-3.bin
    !insertmacro Download https://archive.org/download/grand-theft-auto-vice-city-next-gen-edition/GTAVCNE.EN.RU.Repack/vcNE_setup-4.bin vcNE_setup-4.bin
    !insertmacro Download https://archive.org/download/grand-theft-auto-vice-city-next-gen-edition/GTAVCNE.EN.RU.Repack/vcNE_setup-5.bin vcNE_setup-5.bin
    !insertmacro Download https://archive.org/download/grand-theft-auto-vice-city-next-gen-edition/GTAVCNE.EN.RU.Repack/vcNE_setup-6.bin vcNE_setup-6.bin
    ExecWait '"vcNE_setup.exe" /DIR="$INSTDIR" /SILENT /SUPPRESSMSGBOXES /NORESTART /SP-' $0
    Delete vcNE_setup.exe
    Delete vcNE_setup-1.bin
    Delete vcNE_setup-2.bin
    Delete vcNE_setup-3.bin
    Delete vcNE_setup-4.bin
    Delete vcNE_setup-5.bin
    Delete vcNE_setup-6.bin

    SetOutPath $INSTDIR\Redist
    !insertmacro Download https://archive.org/download/grand-theft-auto-vice-city-next-gen-edition/GTAVCNE.EN.RU.Repack/Redist/vcredist_x86.exe vcredist_x86.exe
    ExecWait '"vcredist_x86.exe"' $0

    SetOutPath $INSTDIR\Redist\DirectX
    !insertmacro Download https://archive.org/download/grand-theft-auto-vice-city-next-gen-edition/GTAVCNE.EN.RU.Repack/Redist/DirectX/DirectX%20Web%20setup.exe "DirectX Web setup.exe"
    ExecWait '"DirectX Web setup.exe"' $0
SectionEnd
