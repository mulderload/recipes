; UI
!include MUI2.nsh
!define MUI_ICON "..\..\templates\icon.ico"

; My Macros / Functions
!include "..\..\templates\includes\download.nsh"
!include "..\..\templates\includes\abort_if_folder_not_empty.nsh"
!include "..\..\templates\includes\replace_in_file.nsh"
!include "..\..\templates\includes\select_exe.nsh"

; Customize pages
!define MUI_COMPONENTSPAGE_NODESC
!include "..\..\templates\includes\wording.nsh"

; MUI Macros
!insertmacro MUI_PAGE_WELCOME
Page Custom CUSTOM_PAGE_SELECT_FILE
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Run as user by default
RequestExecutionLevel none
