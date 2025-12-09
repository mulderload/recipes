!define MUI_WELCOMEPAGE_TEXT "Welcome to this NSIS installer from the MulderLoad project.$\r$\n$\r$\nIt will restore your Steam installation of Fallout 4 from v1.11.169 (november 2025) to v1.10.163 (december 2019).$\r$\n$\r$\nIt is compatible with every editions (base game only, GOTY, and anything between) and every languages.$\r$\n$\r$\nThis installer will auto-detect your installed language and your installed DLCs, then will download 'delta' downgrades for the necessary Steam depots.$\r$\n$\r$\nWARNING (for chineses): if your Fallout 4 is in chinese, auto language detection will sadly not work for you. So, you will have to check Chinese in the components page."
!include "..\..\templates\select_exe.nsh"
!include "..\..\templates\includes\xdelta3.nsh"
Name "Fallout 4 [Steam Downgrader]"

Var /GLOBAL F4_Language
Var /GLOBAL DLC_Automatron
Var /GLOBAL DLC_Workshop

SectionGroup /e "[Steam] Downgrade to v1.10.163 (oldgen)" slang
    Section "Auto-detect language (doesn't work for chinese)" slang_auto
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

    Section /o "My game is in traditional chinese" slang_cn
        StrCpy $F4_Language "cn"
    SectionEnd

    Section
        StrCpy $DLC_Automatron "no"
        StrCpy $DLC_Workshop "no"

        IfFileExists "$INSTDIR\Data\DLCRobot.cdx" 0 +2
            StrCpy $DLC_Automatron "yes"
        
        IfFileExists "$INSTDIR\Data\DLCworkshop01.cdx" 0 +2
            StrCpy $DLC_Workshop "yes"

        MessageBox MB_YESNO|MB_ICONQUESTION "Please check auto-detection before continue.$\r$\n$\r$\nDetected language : $F4_Language$\r$\nAutomatron DLC: $DLC_Automatron$\r$\nWasteland Workshop DLC: $DLC_Workshop$\r$\n$\r$\nIs this correct?" IDYES +2
        Abort

        SetOutPath $INSTDIR

        DetailPrint " // Downloading downgrade 377161 (Base game)"
        !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/377161.7z "377161.7z"
        Nsis7z::ExtractWithDetails "377161.7z" "Extracting downgrade 377162 %s..."
        Delete "377161.7z"

        DetailPrint " // Downloading downgrade 377162 (Base game)"
        !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/377162.7z "377162.7z"
        Nsis7z::ExtractWithDetails "377162.7z" "Extracting downgrade 377162 %s..."
        Delete "377162.7z"

        DetailPrint " // Downloading downgrade 377163 (Base game)"
        Delete "Data\ccBGSFO4044-HellfirePowerArmor.esl"
        Delete "Data\ccBGSFO4046-TesCan - Main.ba2"
        Delete "Data\ccBGSFO4046-TesCan - Textures.ba2"
        Delete "Data\ccBGSFO4046-TesCan.esl"
        Delete "Data\ccBGSFO4096-AS_Enclave - Main.ba2"
        Delete "Data\ccBGSFO4096-AS_Enclave - Textures.ba2"
        Delete "Data\ccBGSFO4096-AS_Enclave.esl"
        Delete "Data\ccBGSFO4110-WS_Enclave - Main.ba2"
        Delete "Data\ccBGSFO4110-WS_Enclave - Textures.ba2"
        Delete "Data\ccBGSFO4110-WS_Enclave.esl"
        Delete "Data\ccBGSFO4115-X02 - Main.ba2"
        Delete "Data\ccBGSFO4115-X02 - Textures.ba2"
        Delete "Data\ccBGSFO4115-X02.esl"
        Delete "Data\ccBGSFO4116-HeavyFlamer - Main.ba2"
        Delete "Data\ccBGSFO4116-HeavyFlamer - Textures.ba2"
        Delete "Data\ccBGSFO4116-HeavyFlamer.esl"
        Delete "Data\ccFSVFO4007-Halloween - Main.ba2"
        Delete "Data\ccFSVFO4007-Halloween - Textures.ba2"
        Delete "Data\ccFSVFO4007-Halloween.esl"
        Delete "Data\ccOTMFO4001-Remnants - Main.ba2"
        Delete "Data\ccOTMFO4001-Remnants - Textures.ba2"
        Delete "Data\ccOTMFO4001-Remnants.esl"
        Delete "Data\ccSBJFO4003-Grenade - Main.ba2"
        Delete "Data\ccSBJFO4003-Grenade - Textures.ba2"
        Delete "Data\ccSBJFO4003-Grenade.esl"
        Delete "Data\Fallout4 - TexturesPatch.ba2"
        Delete "Fallout4IDs.ccc"
        !insertmacro DownloadRange https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/377163.7z "377163.7z" 22
        Nsis7z::ExtractWithDetails "377163.7z.001" "Extracting downgrade 377163 %s..."
        !insertmacro DeleteRange "377163.7z" 22

        ${If} $F4_Language == "fr"
            DetailPrint " // Downloading downgrade 377165 (Base game, French)"
            !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/377165.7z "377165.7z"
            Nsis7z::ExtractWithDetails "377165.7z" "Extracting downgrade 377165 %s..."
            Delete "377165.7z"
        ${ElseIf} $F4_Language == "de"
            DetailPrint " // Downloading downgrade 377166 (Base game, German)"
            !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/377166.7z "377166.7z"
            Nsis7z::ExtractWithDetails "377166.7z" "Extracting downgrade 377166 %s..."
            Delete "377166.7z"
        ${ElseIf} $F4_Language == "it"
            DetailPrint " // Downloading downgrade 377167 (Base game, Italian)"
            !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/377167.7z "377167.7z"
            Nsis7z::ExtractWithDetails "377167.7z" "Extracting downgrade 377167 %s..."
            Delete "377167.7z"
        ${ElseIf} $F4_Language == "es"
            DetailPrint " // Downloading downgrade 377168 (Base game, Spanish)"
            !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/377168.7z "377168.7z"
            Nsis7z::ExtractWithDetails "377168.7z" "Extracting downgrade 377168 %s..."
            Delete "377168.7z"
        ${ElseIf} $F4_Language == "pl"
            DetailPrint " // Downloading downgrade 393880 (Base game, Polish)"
            !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/393880.7z "393880.7z"
            Nsis7z::ExtractWithDetails "393880.7z" "Extracting downgrade 393880 %s..."
            Delete "393880.7z"
        ${ElseIf} $F4_Language == "ru"
            DetailPrint " // Downloading downgrade 393881 (Base game, Russian)"
            !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/393881.7z "393881.7z"
            Nsis7z::ExtractWithDetails "393881.7z" "Extracting downgrade 393881 %s..."
            Delete "393881.7z"
        ${ElseIf} $F4_Language == "ptbr"
            DetailPrint " // Downloading downgrade 393882 (Base game, Portuguese-Brazil)"
            !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/393882.7z "393882.7z"
            Nsis7z::ExtractWithDetails "393882.7z" "Extracting downgrade 393882 %s..."
            Delete "393882.7z"
        ${ElseIf} $F4_Language == "ja"
            DetailPrint " // Downloading downgrade 393884 (Base game, Japanese)"
            Rename "Data\Fallout4 - Voices_jp.ba2" "Data\Fallout4 - Voices.ba2"
            Rename "Data\Fallout4 - Voices_rep_ja.ba2" "Data\Fallout4 - Voices_rep.ba2"
            Rename "Data\Video\AGILITY_ja.bk2" "Data\Video\AGILITY.bk2"
            Rename "Data\Video\CHARISMA_ja.bk2" "Data\Video\CHARISMA.bk2"
            Rename "Data\Video\Endgame_FEMALE_A_ja.bk2" "Data\Video\Endgame_FEMALE_A.bk2"
            Rename "Data\Video\Endgame_FEMALE_B_ja.bk2" "Data\Video\Endgame_FEMALE_B.bk2"
            Rename "Data\Video\Endgame_MALE_A_ja.bk2" "Data\Video\Endgame_MALE_A.bk2"
            Rename "Data\Video\Endgame_MALE_B_ja.bk2" "Data\Video\Endgame_MALE_B.bk2"
            Rename "Data\Video\ENDURANCE_ja.bk2" "Data\Video\ENDURANCE.bk2"
            Rename "Data\Video\GameIntro_V3_B_ja.bk2" "Data\Video\GameIntro_V3_B.bk2"
            Rename "Data\Video\INTELLIGENCE_ja.bk2" "Data\Video\INTELLIGENCE.bk2"
            Rename "Data\Video\Intro_ja.bk2" "Data\Video\Intro.bk2"
            Rename "Data\Video\LUCK_ja.bk2" "Data\Video\LUCK.bk2"
            Rename "Data\Video\PERCEPTION_ja.bk2" "Data\Video\PERCEPTION.bk2"
            Rename "Data\Video\STRENGTH_ja.bk2" "Data\Video\STRENGTH.bk2"
            !insertmacro DownloadRange https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/393884.7z "393884.7z" 4
            Nsis7z::ExtractWithDetails "393884.7z.001" "Extracting downgrade 393884 %s..."
            !insertmacro DeleteRange "393884.7z" 4
        ${ElseIf} $F4_Language == "cn"
            DetailPrint " // Downloading downgrade 393883 (Base game, Chinese-Traditional)"
            !insertmacro DownloadRange https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/393883.7z "393883.7z" 6
            Nsis7z::ExtractWithDetails "393883.7z.001" "Extracting downgrade 393883 %s..."
            !insertmacro DeleteRange "393883.7z" 6
        ${EndIf}

        ${If} $DLC_Automatron == "yes"
            DetailPrint " // Downloading downgrade 435870 (Automatron DLC)"
            !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/435870.7z "435870.7z"
            Nsis7z::ExtractWithDetails "435870.7z" "Extracting downgrade 435870 %s..."
            Delete "435870.7z"

            ${If} $F4_Language == "ja"
                DetailPrint " // Downloading downgrade 404091 (Automatron DLC, Japanese)"
                !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/404091.7z "404091.7z"
                Nsis7z::ExtractWithDetails "404091.7z" "Extracting downgrade 404091 %s..."
                Delete "404091.7z"
            ${ElseIf} $F4_Language == "en"
                DetailPrint " // Downloading downgrade 435871 (Automatron DLC, English)"
                !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/435871.7z "435871.7z"
                Nsis7z::ExtractWithDetails "435871.7z" "Downgrading depot 435871 %s..."
                Delete "435871.7z"
            ${ElseIf} $F4_Language == "fr"
                DetailPrint " // Downloading downgrade 435872 (Automatron DLC, French)"
                !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/435872.7z "435872.7z"
                Nsis7z::ExtractWithDetails "435872.7z" "Downgrading depot 435872 %s..."
                Delete "435872.7z"
            ${ElseIf} $F4_Language == "de"
                DetailPrint " // Downloading downgrade 435873 (Automatron DLC, German)"
                !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/435873.7z "435873.7z"
                Nsis7z::ExtractWithDetails "435873.7z" "Downgrading depot 435873 %s..."
                Delete "435873.7z"
            ${ElseIf} $F4_Language == "it"
                DetailPrint " // Downloading downgrade 435874 (Automatron DLC, Italian)"
                !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/435874.7z "435874.7z"
                Nsis7z::ExtractWithDetails "435874.7z" "Downgrading depot 435874 %s..."
                Delete "435874.7z"
            ${ElseIf} $F4_Language == "es"
                DetailPrint " // Downloading downgrade 435875 (Automatron DLC, Spanish)"
                !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/435875.7z "435875.7z"
                Nsis7z::ExtractWithDetails "435875.7z" "Downgrading depot 435875 %s..."
                Delete "435875.7z"
            ${ElseIf} $F4_Language == "pl"
                DetailPrint " // Downloading downgrade 435876 (Automatron DLC, Polish)"
                !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/435876.7z "435876.7z"
                Nsis7z::ExtractWithDetails "435876.7z" "Extracting downgrade 435876 %s..."
                Delete "435876.7z"
            ${ElseIf} $F4_Language == "ru"
                DetailPrint " // Downloading downgrade 435877 (Automatron DLC, Russian)"
                !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/435877.7z "435877.7z"
                Nsis7z::ExtractWithDetails "435877.7z" "Extracting downgrade 435877 %s..."
                Delete "435877.7z"
            ${ElseIf} $F4_Language == "ptbr"
                DetailPrint " // Downloading downgrade 435878 (Automatron DLC, Portuguese-Brazil)"
                !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/435878.7z "435878.7z"
                Nsis7z::ExtractWithDetails "435878.7z" "Extracting downgrade 435878 %s..."
                Delete "435878.7z"
            ${ElseIf} $F4_Language == "cn"
                DetailPrint " // Downloading downgrade 435879 (Automatron DLC, Chinese-Traditional)"
                !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/435879.7z "435879.7z"
                Nsis7z::ExtractWithDetails "435879.7z" "Extracting downgrade 435879 %s..."
                Delete "435879.7z"
            ${EndIf}
        ${EndIf}

        ${If} $DLC_Workshop == "yes"
            DetailPrint " // Downloading downgrade 435880 (Wasteland Workshop DLC)"
            !insertmacro Download https://cdn2.mulderload.eu/g/fallout-4/steam_downgrade_2025_11/435880.7z "435880.7z"
            Nsis7z::ExtractWithDetails "435880.7z" "Extracting downgrade 435880 %s..."
            Delete "435880.7z"
        ${EndIf}

        DetailPrint " // Downloading xdelta3"
        !insertmacro Download https://github.com/jmacd/xdelta-gpl/releases/download/v3.0.11/xdelta3-3.0.11-x86_64.exe.zip "xdelta3.zip"
        nsisunz::Unzip "xdelta3.zip" ".\"
        Delete "xdelta3.zip"
        Rename "xdelta3-3.0.11-x86_64.exe" "xdelta3.exe"
        
        DetailPrint " // Applying xdelta patches"
        !insertmacro XDelta3_ApplyPatches "$INSTDIR"
        Delete "xdelta3.exe"
    SectionEnd

SectionGroupEnd

Section /o "[Steam] Block future update"
    SetOutPath $INSTDIR\..\..
    DetailPrint " // Block future update (appmanifest_377160.acf)"
    SetFileAttributes "appmanifest_377160.acf" READONLY
SectionEnd

Function .onInit
    StrCpy $SELECT_FILENAME "Fallout4.exe"
    StrCpy $SELECT_DEFAULT_FOLDER "C:\Program Files (x86)\Steam\steamapps\common\Fallout 4"
    StrCpy $SELECT_RELATIVE_INSTDIR ""
    StrCpy $1 ${slang_auto} ; Radio Button
FunctionEnd

Function .onSelChange
    ${If} ${SectionIsSelected} ${slang}
        !insertmacro StartRadioButtons $1
            !insertmacro RadioButton ${slang_auto}
            !insertmacro RadioButton ${slang_cn}
        !insertmacro EndRadioButtons
    ${EndIf}
FunctionEnd
