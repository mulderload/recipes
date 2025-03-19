!include "..\..\includes\standard.nsh"

Name "Streets of Rage Remake"
InstallDir "C:\MulderLoad\Streets of Rage Remake"

Section "Streets of Rage Remake v5.2"
  RMDir $INSTDIR
  SetOutPath $INSTDIR.tmp
  !insertmacro Download https://archive.org/download/streets-of-rage-remake/Streets%20of%20Rage%20Remake%20%285.2%29.zip "Streets_of_Rage_Remake_5.2.zip"
  nsisunz::Unzip "$INSTDIR.tmp\Streets_of_Rage_Remake_5.2.zip" "$INSTDIR.tmp"
  Rename "$INSTDIR.tmp\Streets of Rage Remake (5.2)" $INSTDIR
  SetOutPath $INSTDIR\..
  RMDir /r $INSTDIR.tmp
SectionEnd
