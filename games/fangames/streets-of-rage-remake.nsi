!include "..\..\templates\standard.nsh"

Name "Streets of Rage Remake"
InstallDir "C:\MulderLoad\Streets of Rage Remake"

Section "Streets of Rage Remake v5.2"
    SectionIn RO
    !insertmacro AbortIfFolderNotEmpty $INSTDIR
    SetOutPath $INSTDIR.tmp

    !insertmacro Download https://archive.org/download/streets-of-rage-remake/Streets%20of%20Rage%20Remake%20%285.2%29.zip "Streets_of_Rage_Remake_5.2.zip"
    nsisunz::Unzip "Streets_of_Rage_Remake_5.2.zip" ".\"
    Delete "Streets_of_Rage_Remake_5.2.zip"

    Rename "$INSTDIR.tmp\Streets of Rage Remake (5.2)" $INSTDIR
    SetOutPath $INSTDIR
    RMDir $INSTDIR.tmp
SectionEnd
