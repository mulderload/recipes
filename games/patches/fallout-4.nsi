!define MUI_WELCOMEPAGE_TEXT "Welcome to this NSIS installer from the MulderLoad project.$\r$\n$\r$\nIt will restore your Steam installation of Fallout 4 to v1.10.163 (the pre-next-gen version).$\r$\n$\r$\nIt is compatible with every editions (base game only, GOTY, and anything between) and every languages.$\r$\n$\r$\nThis installer will auto-detect your installed language and your installed DLCs, then will download 'delta' downgrades for the necessary Steam depots.$\r$\n$\r$\nWARNING (for chineses): if your Fallout 4 is in chinese, auto language detection will sadly not work for you. So, you will have to check Chinese in the components page."
!include "..\..\templates\select_exe.nsh"
Name "Fallout 4 [Steam Downgrader]"

SectionGroup /e "[Steam] Restore Fallout 4 to v1.10.163" slang
    Section
        SetOutPath $INSTDIR

        DetailPrint " // Downgrade depot 377162 (base game)"
        !insertmacro Download https://www.mediafire.com/file_premium/r156kxarxsru7rd/depot_377162_downgrade.7z/file "depot_377162_downgrade.7z"
        Nsis7z::ExtractWithDetails "depot_377162_downgrade.7z" "Downgrading depot 377162 %s..."
        Delete "depot_377162_downgrade.7z"

        DetailPrint " // Downgrade depot 377163 (base game)"
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
        Delete "Fallout4IDs.ccc"
        !insertmacro DownloadRange https://cdn.steampatches.com/g/p/fallout-4/depot_377163_downgrade.7z "depot_377163_downgrade.7z" 30
        Nsis7z::ExtractWithDetails "depot_377163_downgrade.7z.001" "Downgrading depot 377163 %s..."
        !insertmacro DeleteRange "depot_377163_downgrade.7z" 30

        IfFileExists "Data\DLCRobot.cdx" 0 end_435870
            DetailPrint " // Downgrade depot 435870 (automatron)"
            !insertmacro Download https://www.mediafire.com/file_premium/mi6unii9wtz5kal/depot_435870_downgrade.7z/file "depot_435870_downgrade.7z"
            Nsis7z::ExtractWithDetails "depot_435870_downgrade.7z" "Downgrading depot 435870 %s..."
            Delete "depot_435870_downgrade.7z"
            end_435870:
        
        IfFileExists "Data\DLCworkshop01.cdx" 0 end_435880
            DetailPrint " // Downgrade depot 435880 (wasteland workshop)"
            !insertmacro Download https://www.mediafire.com/file_premium/bv92yqz75rmcjnb/depot_435880_downgrade.7z/file "depot_435880_downgrade.7z"
            Nsis7z::ExtractWithDetails "depot_435880_downgrade.7z" "Downgrading depot 435880 %s..."
            Delete "depot_435880_downgrade.7z"
            end_435880:
    SectionEnd

    Section "All others languages (auto-detection)" slang_auto
        SetOutPath $INSTDIR
        
        IfFileExists "$INSTDIR\Data\Fallout4 - Voices_fr.ba2" 0 end_377165
            DetailPrint " // Downgrade depot_377165 (base game, fr)"
            !insertmacro DownloadRange https://cdn.steampatches.com/g/p/fallout-4/depot_377165_downgrade.7z "depot_377165_downgrade.7z" 5
            Nsis7z::ExtractWithDetails "depot_377165_downgrade.7z.001" "Downgrading depot 377165 %s..."
            !insertmacro DeleteRange "depot_377165_downgrade.7z" 5
            end_377165:
        
        IfFileExists "$INSTDIR\Data\Fallout4 - Voices_de.ba2" 0 end_377166
            DetailPrint " // Downgrade depot_377166 (base game, de)"
            !insertmacro DownloadRange https://cdn.steampatches.com/g/p/fallout-4/depot_377166_downgrade.7z "depot_377166_downgrade.7z" 5
            Nsis7z::ExtractWithDetails "depot_377166_downgrade.7z.001" "Downgrading depot 377166 %s..."
            !insertmacro DeleteRange "depot_377166_downgrade.7z" 5
            end_377166:

        IfFileExists "$INSTDIR\Data\Fallout4 - Voices_it.ba2" 0 end_377167
            DetailPrint " // Downgrade depot_377167 (base game, it)"
            !insertmacro DownloadRange https://cdn.steampatches.com/g/p/fallout-4/depot_377167_downgrade.7z "depot_377167_downgrade.7z" 5
            Nsis7z::ExtractWithDetails "depot_377167_downgrade.7z.001" "Downgrading depot 377167 file %s..."
            !insertmacro DeleteRange "depot_377167_downgrade.7z" 5
            end_377167:

        IfFileExists "Data\Fallout4 - Voices_es.ba2" 0 end_377168
            DetailPrint " // Downgrade depot_377168 (base game, es)"
            !insertmacro DownloadRange https://cdn.steampatches.com/g/p/fallout-4/depot_377168_downgrade.7z "depot_377168_downgrade.7z" 5
            Nsis7z::ExtractWithDetails "depot_377168_downgrade.7z.001" "Downgrading depot 377168 %s..."
            !insertmacro DeleteRange "depot_377168_downgrade.7z" 5
            end_377168:
        
        IfFileExists "Data\Video\Intro_pl.bk2" 0 end_393880
            DetailPrint " // Downgrade depot_393880 (base game, pl)"
            !insertmacro Download https://www.mediafire.com/file_premium/ba8bj2pfqz8pp70/depot_393880_downgrade.7z/file "depot_393880_downgrade.7z"
            Nsis7z::ExtractWithDetails "depot_393880_downgrade.7z" "Downgrading depot 393880 %s..."
            Delete "depot_393880_downgrade.7z"
            end_393880:

        IfFileExists "Data\Video\Intro_ru.bk2" 0 end_393881
            DetailPrint " // Downgrade depot_393881 (base game, ru)"
            !insertmacro Download https://www.mediafire.com/file_premium/sjtxbf6j35zojp8/depot_393881_downgrade.7z/file "depot_393881_downgrade.7z"
            Nsis7z::ExtractWithDetails "depot_393881_downgrade.7z" "Downgrading depot 393881 %s..."
            Delete "depot_393881_downgrade.7z"
            end_393881:
        
        IfFileExists "Data\Video\Intro_ptbr.bk2" 0 end_393882
            DetailPrint " // Downgrade depot_393882 (base game, pt)"
            !insertmacro Download https://www.mediafire.com/file_premium/riye91yis9jcj5h/depot_393882_downgrade.7z/file "depot_393882_downgrade.7z"
            Nsis7z::ExtractWithDetails "depot_393882_downgrade.7z" "Downgrading depot 393882 %s..."
            Delete "depot_393882_downgrade.7z"
            end_393882:

        IfFileExists "Data\Video\Intro_ja.bk2" 0 end_393884
            DetailPrint " // Downgrade depot_393884 (base game, ja)"
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
            !insertmacro DownloadRange https://cdn.steampatches.com/g/p/fallout-4/depot_393884_downgrade.7z "depot_393884_downgrade.7z" 4
            Nsis7z::ExtractWithDetails "depot_393884_downgrade.7z.001" "Downgrading depot 393884 %s..."
            !insertmacro DeleteRange "depot_393884_downgrade.7z" 4
            end_393884:

        IfFileExists "Data\DLCRobot - Voices_en.ba2" 0 end_435871
            DetailPrint " // Downgrade depot_435871 (automatron, en)"
            !insertmacro Download https://www.mediafire.com/file_premium/umfxzmmzafn8uds/depot_435871_downgrade.7z/file "depot_435871_downgrade.7z"
            Nsis7z::ExtractWithDetails "depot_435871_downgrade.7z" "Downgrading depot 435871 %s..."
            Delete "depot_435871_downgrade.7z"
            end_435871:

        IfFileExists "Data\DLCRobot - Voices_fr.ba2" 0 end_435872
            DetailPrint " // Downgrade depot_435872 (automatron, fr)"
            !insertmacro Download https://www.mediafire.com/file_premium/g78ci3ymsrhy7j0/depot_435872_downgrade.7z/file "depot_435872_downgrade.7z"
            Nsis7z::ExtractWithDetails "depot_435872_downgrade.7z" "Downgrading depot 435872 %s..."
            Delete "depot_435872_downgrade.7z"
            end_435872:

        IfFileExists "Data\DLCRobot - Voices_de.ba2" 0 end_435873
            DetailPrint " // Downgrade depot_435873 (automatron, de)"
            !insertmacro Download https://www.mediafire.com/file_premium/bf5fc9scc4wrst5/depot_435873_downgrade.7z/file "depot_435873_downgrade.7z"
            Nsis7z::ExtractWithDetails "depot_435873_downgrade.7z" "Downgrading depot 435873 %s..."
            Delete "depot_435873_downgrade.7z"
            end_435873:

        IfFileExists "Data\DLCRobot - Voices_it.ba2" 0 end_435874
            DetailPrint " // Downgrade depot_435874 (automatron, it)"
            !insertmacro Download https://www.mediafire.com/file_premium/xcndl1olonb63z4/depot_435874_downgrade.7z/file "depot_435874_downgrade.7z"
            Nsis7z::ExtractWithDetails "depot_435874_downgrade.7z" "Downgrading depot 435874 %s..."
            Delete "depot_435874_downgrade.7z"
            end_435874:

        IfFileExists "Data\DLCRobot - Voices_es.ba2" 0 end_435875
            DetailPrint " // Downgrade depot_435875 (automatron, es)"
            !insertmacro Download https://www.mediafire.com/file_premium/mk8t9bchshd2zzs/depot_435875_downgrade.7z/file "depot_435875_downgrade.7z"
            Nsis7z::ExtractWithDetails "depot_435875_downgrade.7z" "Downgrading depot 435875 %s..."
            Delete "depot_435875_downgrade.7z"
            end_435875:
        
        IfFileExists "Data\Video\Intro_pl.bk2" 0 end_435876
            DetailPrint " // Downgrade depot_435876 (automatron, pl)"
            !insertmacro Download https://www.mediafire.com/file_premium/gfccjh4jzop167f/depot_435876_downgrade.7z/file "depot_435876_downgrade.7z"
            Nsis7z::ExtractWithDetails "depot_435876_downgrade.7z" "Downgrading depot 435876 %s..."
            Delete "depot_435876_downgrade.7z"
            end_435876:

        IfFileExists "Data\Video\Intro_ru.bk2" 0 end_435877
            DetailPrint " // Downgrade depot_435877 (automatron, ru)"
            !insertmacro Download https://www.mediafire.com/file_premium/nlrfrkl23jfsflv/depot_435877_downgrade.7z/file "depot_435877_downgrade.7z"
            Nsis7z::ExtractWithDetails "depot_435877_downgrade.7z" "Downgrading depot 435877 %s..."
            Delete "depot_435877_downgrade.7z"
            end_435877:
        
        IfFileExists "Data\Video\Intro_ptbr.bk2" 0 end_435878
            DetailPrint " // Downgrade depot_435878 (automatron, en)"
            !insertmacro Download https://www.mediafire.com/file_premium/dwp26uh3vrppl6j/depot_435878_downgrade.7z/file "depot_435878_downgrade.7z"
            Nsis7z::ExtractWithDetails "depot_435878_downgrade.7z" "Downgrading depot 435878 %s..."
            Delete "depot_435878_downgrade.7z"
            end_435878:

        IfFileExists "Data\Video\Intro_ja.bk2" 0 end_404091
            DetailPrint " // Downgrade depot_404091 (automatron, ja)"
            !insertmacro Download https://www.mediafire.com/file_premium/x26wsn1yownr2cq/depot_404091_downgrade.7z/file "depot_404091_downgrade.7z"
            Nsis7z::ExtractWithDetails "depot_404091_downgrade.7z" "Downgrading depot 404091 %s..."
            Delete "depot_404091_downgrade.7z"
            end_404091:
    SectionEnd

    Section /o "Traditional chinese language" slang_cn
        SetOutPath $INSTDIR

        DetailPrint " // Downgrade depot 393883 (base game, cn)"
        !insertmacro DownloadRange https://cdn.steampatches.com/g/p/fallout-4/depot_393883_downgrade.7z "depot_393883_downgrade.7z" 6
        Nsis7z::ExtractWithDetails "depot_393883_downgrade.7z.001" "Downgrading depot 393883 %s..."
        !insertmacro DeleteRange "depot_393883_downgrade.7z" 6

        IfFileExists "Data\DLCRobot.cdx" 0 end_435879
            DetailPrint " // Downgrade depot 435879 (automatron, cn)"
            !insertmacro Download https://www.mediafire.com/file_premium/xu0rmyi527viy6f/depot_435879_downgrade.7z/file "depot_435879_downgrade.7z"
            Nsis7z::ExtractWithDetails "depot_435879_downgrade.7z" "Downgrading depot 435879 %s..."
            Delete "depot_435879_downgrade.7z"
            end_435879:
    SectionEnd

    Section
        SetOutPath $INSTDIR\..\..

        DetailPrint " // Block future update (appmanifest_377160.acf)"
        SetFileAttributes "appmanifest_377160.acf" READONLY
    SectionEnd
SectionGroupEnd

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
