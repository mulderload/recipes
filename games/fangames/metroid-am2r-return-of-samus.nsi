!include "..\..\includes\standard.nsh"

Name "AM2R"
InstallDir "C:\MulderLoad\AM2R"

Section "AM2R v1.1 + AM2RLauncher v2.3"
    SetOutPath $INSTDIR
    !insertmacro Download https://archive.org/download/am2r1.1/am2r-another-metroid-2-remake-1-1.zip AM2R_11.zip
    !insertmacro Download https://github.com/AM2R-Community-Developers/AM2RLauncher/releases/download/2.3.0/AM2RLauncher_2.3.0_win_DownloadMe.zip AM2RLauncher_2.3.0_win_DownloadMe.zip
    nsisunz::Unzip "$INSTDIR\AM2RLauncher_2.3.0_win_DownloadMe.zip" "$INSTDIR"
    Delete "AM2RLauncher_2.3.0_win_DownloadMe.zip"
SectionEnd
