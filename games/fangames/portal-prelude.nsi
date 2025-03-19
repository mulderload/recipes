!include "..\..\includes\standard.nsh"

Name "Portal: Prelude"
InstallDir "$PROGRAMFILES\Steam\steamapps\sourcemods\portal prelude"

Section "Portal: Prelude v1.2.1"
    SetOutPath $INSTDIR
    !insertmacro Download https://www.portalprelude.com/download.php?id=149 portal-prelude-archive-1.2.1.zip
    nsisunz::Unzip "$INSTDIR\portal-prelude-archive-1.2.1.zip" "$INSTDIR"
    Delete "portal-prelude-archive-1.2.1.zip"
SectionEnd
