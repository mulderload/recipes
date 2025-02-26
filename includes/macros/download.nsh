!macro Download url file
  inetc::get ${url} ${file} /end
  Pop $0 # return value = exit code, "OK" if OK
  ${If} $0 != "OK"
    MessageBox MB_ICONEXCLAMATION "$0 - ${file}"
	Abort
  ${EndIf}
!macroend
