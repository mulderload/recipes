!define MUI_WELCOMEPAGE_TEXT "Welcome to this NSIS installer from the MulderLoad project.$\r$\n$\r$\nThis installer will download and extract$\r$\n- The Crew Ultimate (dumped from UPlay)$\r$\n- the TCULauncher (from the amazing TCU project!)$\r$\n$\r$\nAs TCU uses dll injection, it's recommended to exclude the folder from your antivirus. This installer has a option to do that, if you use Windows Defender.$\r$\n$\r$\nIf you still own the game on Steam, you can instead only download the patch on my website (mulderland.com)$\r$\n$\r$\nA BIG thanks to the TCU Team who restored this amazing game, and who did more than Ubisoft without the source code. Congratulations!"
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\README-MulderLoad.txt"
!define MUI_FINISHPAGE_SHOWREADME_TEXT "Show manual instructions (important)"
!define MUI_FINISHPAGE_RUN "$INSTDIR\TCULauncher.exe"
!define MUI_FINISHPAGE_RUN_TEXT "Configure TCULauncher"
!include "..\..\templates\standard.nsh"
RequestExecutionLevel admin

Name "The Crew [FULL]"
InstallDir "C:\MulderLoad\The Crew"

Section "The Crew (Ultimate Edition, Worldwide)"
    SetOutPath $INSTDIR

    !insertmacro DownloadRange https://cdn1.mulderload.eu/g/a/the-crew/the-crew-1-worldwide-build502193/the-crew-1-worldwide-build502193.7z "the-crew-1-worldwide-build502193.7z" 41
    Nsis7z::ExtractWithDetails "the-crew-1-worldwide-build502193.7z.001" "Installing package %s..."
    !insertmacro DeleteRange "the-crew-1-worldwide-build502193.7z" 41
SectionEnd

SectionGroup "The Crew Unlimited (Server Emulator) v1.0"
    Section
        SectionIn RO
        SetOutPath $INSTDIR

        !insertmacro Download https://thecrewunlimited.com/TCUNet/TCULauncher/TCULauncher-1.1.2.0.7z "TCULauncher.7z"
        Nsis7z::ExtractWithDetails "TCULauncher.7z" "Installing package %s..."
        Delete "TCULauncher.7z"
        
        !insertmacro Download https://raw.githubusercontent.com/mulderload/recipes/refs/heads/main/resources/the-crew/README.txt "README-MulderLoad.txt"
    SectionEnd

    Section "Whitelist in Windows Defender (recommended)"
        nsExec::Exec "powershell.exe -Command Add-MpPreference -ExclusionPath '$INSTDIR'"
    SectionEnd
SectionGroupEnd
