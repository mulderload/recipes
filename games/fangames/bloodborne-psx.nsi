!include "..\..\templates\standard.nsh"

Name "Bloodborne PSX"
InstallDir "C:\MulderLoad\Bloodborne PSX"

Section "Bloodborne PSX v1.05"
    SectionIn RO
    !insertmacro AbortIfFolderNotEmpty $INSTDIR
    SetOutPath $INSTDIR.tmp

    !insertmacro Download https://archive.org/download/bbpsx-1.05_202204/BBPSX_1.05.zip "BBPSX_1.05.zip"
    nsisunz::Unzip "BBPSX_1.05.zip" ".\"
    Delete "BBPSX_1.05.zip"

    Rename "$INSTDIR.tmp\BBPSX_Build_2022_02_06_1.05\WindowsNoEditor" $INSTDIR
    SetOutPath $INSTDIR
    RMDir $INSTDIR.tmp\BBPSX_Build_2022_02_06_1.05
    RMDir $INSTDIR.tmp
SectionEnd
