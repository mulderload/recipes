Var BROWSE_BUTTON

Var /GLOBAL DIR_EXE_FILENAME
Var /GLOBAL DIR_EXE_DEFAULT_FOLDER
Var /GLOBAL DIR_EXE_RELATIVE_INSTDIR

Function CUSTOM_PAGE_SELECT_FILE
	nsDialogs::Create 1018
	Pop $0

    # Disable Next button
    GetDlgItem $0 $HWNDPARENT 1
    EnableWindow $0 0

	${NSD_CreateBrowseButton} 0 0 100% 12u "Localize $DIR_EXE_FILENAME"
	Pop $BROWSE_BUTTON
	GetFunctionAddress $0 SelectFileDialog
	nsDialogs::OnClick $BROWSE_BUTTON $0

	nsDialogs::Show
FunctionEnd

Function SelectFileDialog
  nsDialogs::SelectFileDialog open "$DIR_EXE_DEFAULT_FOLDER\" "$DIR_EXE_FILENAME|$DIR_EXE_FILENAME"
  Call GetParent
  Pop $R0

  # Re-enable Next button
  ${If} $R0 != ""
    GetDlgItem $0 $HWNDPARENT 1
    EnableWindow $0 1
  ${EndIf}

  StrCpy $INSTDIR "$R0\$DIR_EXE_RELATIVE_INSTDIR"
FunctionEnd

Function GetParent ; https://nsis.sourceforge.io/Get_parent_directory
  Exch $R0
  Push $R1
  Push $R2
  Push $R3
 
  StrCpy $R1 0
  StrLen $R2 $R0
 
  loop:
    IntOp $R1 $R1 + 1
    IntCmp $R1 $R2 get 0 get
    StrCpy $R3 $R0 1 -$R1
    StrCmp $R3 "\" get
  Goto loop
 
  get:
    StrCpy $R0 $R0 -$R1
 
    Pop $R3
    Pop $R2
    Pop $R1
    Exch $R0
FunctionEnd
