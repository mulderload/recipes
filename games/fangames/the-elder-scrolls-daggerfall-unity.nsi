!include "..\..\includes\standard.nsh"

Name "Daggerfall Unity"
InstallDir "C:\MulderLoad\Daggerfall Unity"

Section "Daggerfall Unity v1.1.1"
    SetOutPath $INSTDIR

    !insertmacro Download https://github.com/Interkarma/daggerfall-unity/releases/download/v1.1.1/dfu_windows_64bit-v1.1.1.zip dfu.zip
    nsisunz::Unzip "$INSTDIR\dfu.zip" "$INSTDIR"
    Delete dfu.zip
SectionEnd

Section "Required Original Game Files"
    SetOutPath $INSTDIR

    !insertmacro Download https://archive.org/download/daggerfall-play/Daggerfall.zip Daggerfall.zip
    nsisunz::Unzip "$INSTDIR\Daggerfall.zip" "$INSTDIR"
    Delete Daggerfall.zip

    Rename "$INSTDIR\DAGGER\ARENA2" $INSTDIR\ARENA2
    RMDir /r $INSTDIR\DAGGER
    Delete dagger.bat
SectionEnd
