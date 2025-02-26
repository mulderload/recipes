!include "..\..\includes\standard.nsh"

Name "Broken Sword 2.5: The Return of the Templars"
InstallDir "$PROGRAMFILES\Test\Broken Sword 2.5 - The Return of the Templars"

Section "Broken Sword 2.5: The Return of the Templars"
  SetOutPath $INSTDIR
  !insertmacro Download $%URL_MEDIAFIRE_TEST% bs25setup.zip
SectionEnd
