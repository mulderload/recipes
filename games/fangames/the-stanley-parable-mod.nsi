!include "..\..\includes\standard.nsh"

Name "The Stanley Parable (mod)"
InstallDir "$PROGRAMFILES\Steam\steamapps\sourcemods\thestanleyparable"

Section "Source SDK Base 2007 (Steam)"
    Exec '"$INSTDIR\..\..\..\steam.exe" steam://install/218'
    MessageBox MB_ICONEXCLAMATION  "Steam will install Source SDK Base 2007. Click OK when it's done, to resume the installation here."
SectionEnd

Section "The Stanley Parable (mod)"
  SetOutPath $INSTDIR
  !insertmacro Download https://www.mediafire.com/file_premium/xffffm9ryi03mz6/The_Stanley_Parable_v1.4.zip/file The_Stanley_Parable_v1.4.zip
  nsisunz::Unzip "$INSTDIR\The_Stanley_Parable_v1.4.zip" "$INSTDIR"
  Delete "The_Stanley_Parable_v1.4.zip"
SectionEnd

