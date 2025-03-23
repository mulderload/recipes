!include "..\..\includes\dir_exe.nsh"

Function .onInit
    StrCpy $DIR_EXE_FILENAME "steam.exe"
    StrCpy $DIR_EXE_DEFAULT_FOLDER "C:\Program Files (x86)\Steam"
    StrCpy $DIR_EXE_RELATIVE_INSTDIR "steamapps\sourcemods"
FunctionEnd

Name "The Stanley Parable (mod)"

Section "Source SDK Base 2007 (Steam)"
    MessageBox MB_ICONINFORMATION  "Steam will install Source SDK Base 2007. Click OK and follow instructions on Steam."
    Exec '"$INSTDIR\..\..\..\steam.exe" steam://install/218'
    Sleep 10000
    MessageBox MB_OK "Click OK when 'Source SDK Base 2007' installation is complete."
SectionEnd

Section "The Stanley Parable (mod) v1.4"
  SetOutPath $INSTDIR
  !insertmacro Download https://www.mediafire.com/file_premium/xffffm9ryi03mz6/The_Stanley_Parable_v1.4.zip/file The_Stanley_Parable_v1.4.zip
  nsisunz::Unzip "$INSTDIR\The_Stanley_Parable_v1.4.zip" "$INSTDIR"
  Delete "The_Stanley_Parable_v1.4.zip"
  RMDir /r "$INSTDIR\__MACOSX"
  Rename "$INSTDIR\author commentary.txt" "$INSTDIR\thestanleyparable\author commentary.txt"
  Rename "$INSTDIR\changelist.txt" "$INSTDIR\thestanleyparable\changelist.txt"
  Rename "$INSTDIR\readme.txt" "$INSTDIR\thestanleyparable\readme.txt"
SectionEnd
