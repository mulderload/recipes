!macro Download url file
  NScurl::http GET ${url} ${file} /INSIST /RESUME /CANCEL /END
  Pop $0 # return value = exit code, "OK" if OK
  ${If} $0 != "OK"
    MessageBox MB_ICONEXCLAMATION "$0 - ${file}"
	Abort
  ${EndIf}
!macroend

!macro DownloadRange url file nbParts
  StrCpy $1 1 # currentPart
  loop_dl_${file}:
    IntFmt $2 "%03d" $1 # currentPart with zeros
    !insertmacro Download ${url}.$2 ${file}.$2
    # We break, or we loop
    IntCmp $1 ${nbParts} loop_dl_end_${file}
    IntOp $1 $1 + 1
    Goto loop_dl_${file}
  loop_dl_end_${file}:
!macroend

!macro DeleteRange file nbParts
  StrCpy $1 1 # currentPart
  loop_del_${file}:
    IntFmt $2 "%03d" $1 # currentPart with zeros
    Delete ${file}.$2
    # We break, or we loop
    IntCmp $1 ${nbParts} loop_del_end_${file}
    IntOp $1 $1 + 1
    Goto loop_del_${file}
  loop_del_end_${file}:
!macroend

!macro DownloadIfDifferent file hash url newFile
    IfFileExists "${file}" yes${hash} download${hash}
    yes${hash}:
        NScurl::sha1 "${file}"
        Pop $0
        ${If} $0 == ${hash}
            DetailPrint "File ${file} exists and have correct hash. Skip download."
            goto skip_download${hash}
        ${Else}
            DetailPrint "File ${file} exists but have incorrect hash. Going to download."
        ${EndIf}
    download${hash}:
        !insertmacro Download "${url}" "${newFile}"
    skip_download${hash}:
!macroend

!macro Get7z
    !insertmacro Download https://raw.githubusercontent.com/mulderload/recipes/refs/heads/main/resources/7z/7z.7z "7z.7z"
    Nsis7z::Extract "7z.7z"
    Delete "7z.7z"
!macroend
