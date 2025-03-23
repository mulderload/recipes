!include "..\..\includes\dir_exe.nsh"

Function .onInit
    StrCpy $DIR_EXE_FILENAME "steam.exe"
    StrCpy $DIR_EXE_DEFAULT_FOLDER "C:\Program Files (x86)\Steam"
    StrCpy $DIR_EXE_RELATIVE_INSTDIR "steamapps\sourcemods"
FunctionEnd

Name "Portal: Prelude"

Section "Source SDK Base 2007 (Steam)"
    MessageBox MB_ICONINFORMATION  "Steam will install Source SDK Base 2007. Click OK and follow instructions on Steam."
    Exec '"$INSTDIR\..\..\..\steam.exe" steam://install/218'
    Sleep 10000
    MessageBox MB_OK "Click OK when 'Source SDK Base 2007' installation is complete."
SectionEnd

Section "Portal: Prelude v1.2.1"
    SetOutPath $INSTDIR
    !insertmacro Download https://www.portalprelude.com/download.php?id=149 portal-prelude-archive-1.2.1.zip
    nsisunz::Unzip "$INSTDIR\portal-prelude-archive-1.2.1.zip" "$INSTDIR"
    Delete "portal-prelude-archive-1.2.1.zip"
    Rename "$INSTDIR\README.txt" "$INSTDIR\portal prelude\README.txt"
SectionEnd
