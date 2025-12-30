!define MUI_WELCOMEPAGE_TEXT "Welcome to the LITE edition of the Mulderland's Universal Downgrader, specially built for Nexusmods.$\r$\n$\r$\nIt can downgrade your Steam installation of Fallout 4 from v1.11.191 to v1.11.169. It is compatible with every editions (base game, GOTY, or in-between) and every languages.$\r$\n$\r$\nIf you wish to downgrade to an EARLIER version (v1.10.163 or v1.10.984), you can find the FULL version on my website for free:$\r$\n$\r$\nwww.mulderland.com$\r$\n$\r$\nWARNING (for chineses): if your Fallout 4 is in chinese, auto language detection will sadly not work for you. So, you will have to check Chinese in the components page."
!include "..\..\templates\select_exe.nsh"
!include "..\..\templates\includes\xdelta3.nsh"
Name "Fallout 4 [Steam Downgrader LITE]"

Var /GLOBAL F4_Language
Var /GLOBAL DLC_Automatron
Var /GLOBAL DLC_Workshop

!macro AbortIfUnsupportedVersion
    NScurl::sha1 "$INSTDIR\Fallout4.exe"
    Pop $0
    ${If} $0 == "b4d944af1d97cde4786ad5bbeddc9c40f25e634c"
        DetailPrint " // Supported version detected: v1.11.191 (december 2025)"
    ${Else}
        MessageBox MB_ICONEXCLAMATION "Unsupported Fallout 4 version detected (sha1: $0).$\r$\n$\r$\nThis downgrader only supports the Steam version v1.11.191 (december 2025).$\r$\n$\r$\nAborting."
        Abort
    ${EndIf}
!macroend

!macro AbortIfUserRefuses
    MessageBox MB_YESNO|MB_ICONQUESTION "Please check auto-detection before continue.$\r$\n$\r$\nDetected language : $F4_Language$\r$\nAutomatron DLC: $DLC_Automatron$\r$\nWasteland Workshop DLC: $DLC_Workshop$\r$\n$\r$\nIs this correct?$\r$\n$\r$\n(other DLCs don't need downgrade so I don't look for them)" IDYES +2
    Abort
!macroend

!macro CopyXDelta
    DetailPrint " // Copying xdelta3"
    nsisunz::Unzip "$EXEDIR\xdelta3-3.0.11-x86_64.exe.zip" "$INSTDIR\"
    Rename "$INSTDIR\xdelta3-3.0.11-x86_64.exe" "$INSTDIR\xdelta3.exe"
!macroend

!macro AbortIfInstallDirectory
    ${If} "$INSTDIR" == "$EXEDIR"
        MessageBox MB_ICONEXCLAMATION "You cannot run the downgrader from the game installation folder itself.$\r$\n$\r$\nPlease run the downgrader from another folder, for example a temp folder in your desktop.$\r$\n$\r$\nAborting."
        Abort
    ${EndIf}
!macroend

SectionGroup "Language Detection" lang
    Section "Auto-detect (doesn't work for chinese)" lang_auto
        StrCpy $F4_Language "en"

        IfFileExists "$INSTDIR\Data\Fallout4 - Voices_fr.ba2" 0 +2
            StrCpy $F4_Language "fr"

        IfFileExists "$INSTDIR\Data\Fallout4 - Voices_de.ba2" 0 +2
            StrCpy $F4_Language "de"

        IfFileExists "$INSTDIR\Data\Fallout4 - Voices_it.ba2" 0 +2
            StrCpy $F4_Language "it"
            
        IfFileExists "$INSTDIR\Data\Fallout4 - Voices_es.ba2" 0 +2
            StrCpy $F4_Language "es"
            
        IfFileExists "$INSTDIR\Data\Video\Intro_pl.bk2" 0 +2
            StrCpy $F4_Language "pl"
            
        IfFileExists "$INSTDIR\Data\Video\Intro_ru.bk2" 0 +2
            StrCpy $F4_Language "ru"
            
        IfFileExists "$INSTDIR\Data\Video\Intro_ptbr.bk2" 0 +2
            StrCpy $F4_Language "ptbr"
            
        IfFileExists "$INSTDIR\Data\Video\Intro_ja.bk2" 0 +2
            StrCpy $F4_Language "ja"
    SectionEnd

    Section /o "My game is in traditional chinese" lang_cn
        StrCpy $F4_Language "cn"
    SectionEnd
SectionGroupEnd

SectionGroup /e "Downgrade Steam version (v1.11.191) to" version
    Section
        StrCpy $DLC_Automatron "no"
        StrCpy $DLC_Workshop "no"

        IfFileExists "$INSTDIR\Data\DLCRobot.cdx" 0 +2
            StrCpy $DLC_Automatron "yes"
    
        IfFileExists "$INSTDIR\Data\DLCworkshop01.cdx" 0 +2
            StrCpy $DLC_Workshop "yes"
    SectionEnd
    
    Section /o "1.10.163 (pre-next-gen) - full downgrader only" version_1_10_163
        SectionIn RO
        MessageBox MB_OK "Unavailable on the lite downgrader. Please use the full downgrader instead."
    SectionEnd

    Section /o "1.10.984 (next-gen up2) - full downgrader only" version_1_10_984
        SectionIn RO
        MessageBox MB_OK "Unavailable on the lite downgrader. Please use the full downgrader instead."
    SectionEnd

    Section "1.11.169 (anniversary, november patch)" version_1_11_169
        AddSize 28672
        SetOutPath $INSTDIR
        !insertmacro AbortIfInstallDirectory
        !insertmacro AbortIfUnsupportedVersion
        !insertmacro AbortIfUserRefuses
        !insertmacro CopyXDelta
    
        DetailPrint " // Downloading downgrade 377162 (Base game)"
        Nsis7z::ExtractWithDetails "$EXEDIR\377162.7z" "Extracting downgrade 377162 %s..."
        
        DetailPrint " // Downloading downgrade 377163 (Base game)"
        Nsis7z::ExtractWithDetails "$EXEDIR\377163.7z" "Extracting downgrade 377163 %s..."

        ${If} $DLC_Automatron == "yes"
            ${If} $F4_Language == "ja"
                DetailPrint " // Downloading downgrade 404091 (Automatron DLC, Japanese)"
                Nsis7z::ExtractWithDetails "$EXEDIR\404091.7z" "Extracting downgrade 404091 %s..."
            ${ElseIf} $F4_Language == "en"
                DetailPrint " // Downloading downgrade 435871 (Automatron DLC, English)"
                Nsis7z::ExtractWithDetails "$EXEDIR\435871.7z" "Downgrading depot 435871 %s..."
            ${ElseIf} $F4_Language == "fr"
                DetailPrint " // Downloading downgrade 435872 (Automatron DLC, French)"
                Nsis7z::ExtractWithDetails "$EXEDIR\435872.7z" "Downgrading depot 435872 %s..."
            ${ElseIf} $F4_Language == "de"
                DetailPrint " // Downloading downgrade 435873 (Automatron DLC, German)"
                Nsis7z::ExtractWithDetails "$EXEDIR\435873.7z" "Downgrading depot 435873 %s..."
            ${ElseIf} $F4_Language == "it"
                DetailPrint " // Downloading downgrade 435874 (Automatron DLC, Italian)"
                Nsis7z::ExtractWithDetails "$EXEDIR\435874.7z" "Downgrading depot 435874 %s..."
            ${ElseIf} $F4_Language == "es"
                DetailPrint " // Downloading downgrade 435875 (Automatron DLC, Spanish)"
                Nsis7z::ExtractWithDetails "$EXEDIR\435875.7z" "Downgrading depot 435875 %s..."
            ${ElseIf} $F4_Language == "pl"
                DetailPrint " // Downloading downgrade 435876 (Automatron DLC, Polish)"
                Nsis7z::ExtractWithDetails "$EXEDIR\435876.7z" "Extracting downgrade 435876 %s..."
            ${ElseIf} $F4_Language == "ru"
                DetailPrint " // Downloading downgrade 435877 (Automatron DLC, Russian)"
                Nsis7z::ExtractWithDetails "$EXEDIR\435877.7z" "Extracting downgrade 435877 %s..."
            ${ElseIf} $F4_Language == "ptbr"
                DetailPrint " // Downloading downgrade 435878 (Automatron DLC, Portuguese-Brazil)"
                Nsis7z::ExtractWithDetails "$EXEDIR\435878.7z" "Extracting downgrade 435878 %s..."
            ${ElseIf} $F4_Language == "cn"
                DetailPrint " // Downloading downgrade 435879 (Automatron DLC, Chinese-Traditional)"
                Nsis7z::ExtractWithDetails "$EXEDIR\435879.7z" "Extracting downgrade 435879 %s..."
            ${EndIf}
        ${EndIf}

        ${If} $DLC_Workshop == "yes"
            DetailPrint " // Downloading downgrade 435880 (Wasteland Workshop DLC)"
            Nsis7z::ExtractWithDetails "$EXEDIR\435880.7z" "Extracting downgrade 435880 %s..."
        ${EndIf}
    SectionEnd

    Section
        SetOutPath $INSTDIR
        DetailPrint " // Applying xdelta patches"
        !insertmacro XDelta3_ApplyPatches "$INSTDIR"
        DetailPrint " // Remove xdelta3"
        Delete "xdelta3.exe"
    SectionEnd
SectionGroupEnd

Section /o "Block future Steam update"
    SetOutPath $INSTDIR\..\..
    DetailPrint " // Block future update (appmanifest_377160.acf)"
    SetFileAttributes "appmanifest_377160.acf" READONLY
SectionEnd

Function .onInit
    StrCpy $SELECT_FILENAME "Fallout4.exe"
    StrCpy $SELECT_DEFAULT_FOLDER "C:\Program Files (x86)\Steam\steamapps\common\Fallout 4"
    StrCpy $SELECT_RELATIVE_INSTDIR ""
    StrCpy $1 ${lang_auto} ; Radio Button
FunctionEnd

Function .onSelChange
    ${If} ${SectionIsSelected} ${lang}
        !insertmacro StartRadioButtons $1
            !insertmacro RadioButton ${lang_auto}
            !insertmacro RadioButton ${lang_cn}
        !insertmacro EndRadioButtons
    ${EndIf}
FunctionEnd
