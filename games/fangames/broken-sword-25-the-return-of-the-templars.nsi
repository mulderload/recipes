!include "..\..\includes\standard.nsh"

Name "Broken Sword 2.5: The Return of the Templars"
InstallDir "C:\MulderLoad\Broken Sword 2.5"

Section "Broken Sword 2.5 + Language Patch 2010"
    SetOutPath $INSTDIR

    !insertmacro Download https://server.c-otto.de/baphometsfluch/bs25setup.zip bs25setup.zip
    nsisunz::Unzip "$INSTDIR\bs25setup.zip" "$INSTDIR"
    Delete bs25setup.zip
    ExecWait '"bs25-setup.exe" /DIR="$INSTDIR" /SILENT /SUPPRESSMSGBOXES /NORESTART /SP-' $0
    Delete bs25-setup.exe
    Delete bs25-setup-1.bin

    !insertmacro Download http://baphometsfluch25.de/downloads/sonstiges/BS25_patch000_multilingual.zip BS25_patch000_multilingual.zip
    nsisunz::Unzip "$INSTDIR\BS25_patch000_multilingual.zip" "$INSTDIR"
    Delete BS25_patch000_multilingual.zip
SectionEnd
