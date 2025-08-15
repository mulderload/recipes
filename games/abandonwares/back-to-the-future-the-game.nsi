!define MUI_WELCOMEPAGE_TEXT "Welcome to this NSIS installer from the MulderLoad project.$\r$\n$\r$\nThis installer will download$\r$\n- RedNukem from official Github (and extract it)$\r$\n- USA ROM of Duke Nukem 64 from Archive.org"
!include "..\..\templates\standard.nsh"

Name "Back to the Future: The Game"
InstallDir "C:\MulderLoad\Back to the Future - The Game"

Section "Back to the Future: The Game"
    SectionIn RO
    SetOutPath $INSTDIR

    !insertmacro DownloadRedirect https://redirect.mulderload.eu/humble/BackToTheFuture_Episode_1-5_Win.zip "BackToTheFuture_Episode_1-5_Win.zip"
SectionEnd
