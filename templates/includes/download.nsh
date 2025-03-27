!macro Download url file
  inetc::get ${url} "${file}" /end
  Pop $0 # return value = exit code, "OK" if OK
  ${If} $0 != "OK"
    MessageBox MB_ICONEXCLAMATION "$0 - ${file}"
	Abort
  ${EndIf}
!macroend

!macro DownloadIfDifferent file hash url newFile
    IfFileExists "${file}" yes${hash} download${hash}
    yes${hash}:
        StrCpy $R0 "CRC-32"  ; PARAM1
        StrCpy $R1 "${file}" ; PARAM2
        HashInfo::GetFileCRCHash "$R0" "$R1"
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
