!include "..\..\includes\standard.nsh"

Name "Black Mesa (mod)"
InstallDir "$PROGRAMFILES\Steam\steamapps\sourcemods\BMS"

Section "Source SDK Base 2007 (Steam)"
    Exec '"$INSTDIR\..\..\..\steam.exe" steam://install/218'
    MessageBox MB_ICONEXCLAMATION  "Steam will install Source SDK Base 2007. Click OK when it's done, to resume the installation here."
SectionEnd

Section "Black Mesa (with 2023 fix)"
    SetOutPath $INSTDIR

    # This zip already includes the 2023 patch, but unzip doesn't work for files > 4Gb
    #!insertmacro Download https://ia600500.us.archive.org/11/items/blackmesa.2/blackmesa.2.zip blackmesa.2.zip

    # So let's use the 2012 version in 7z...
    !insertmacro Download https://ia802205.us.archive.org/6/items/blackmesasource2012/blackmesa.7z blackmesa.7z
    Nsis7z::ExtractWithDetails "$INSTDIR\blackmesa.7z" "Installing package %s..."
    Delete blackmesa.7z

    # ...and the 2023 "update" created with WinMerge
    !insertmacro Download https://www.mediafire.com/file_premium/voo0iccje87wy3o/2023_update.7z/file 2023_update.7z
    Nsis7z::ExtractWithDetails "$INSTDIR\2023_update.7z" "Installing package %s..."
    Delete 2023_update.7z

    # Add VOSTFR for french users
    CopyFiles $INSTDIR\resource\closecaption_english.dat $INSTDIR\resource\closecaption_french.dat
    CopyFiles $INSTDIR\resource\closecaption_english.txt $INSTDIR\resource\closecaption_french.txt
SectionEnd

Section "Patch FR (French Subtitles)"
  SetOutPath $INSTDIR
  !insertmacro Download https://www.mediafire.com/file_premium/2bsqcj02ceiqjkz/Black_Mesa_-_Official_French_Translation_1.0_Setup.exe/file Black_Mesa_-_Official_French_Translation_1.0_Setup.exe
  ExecWait '"Black_Mesa_-_Official_French_Translation_1.0_Setup.exe" /DIR="$INSTDIR" /SILENT /SUPPRESSMSGBOXES /NORESTART /SP-' $0
  Delete "Black_Mesa_-_Official_French_Translation_1.0_Setup.exe"
SectionEnd
