; UI
!include MUI2.nsh
!define MUI_ICON "..\..\templates\icon.ico"

; My Macros / Functions
!include "..\..\templates\includes\download.nsh"
!include "..\..\templates\includes\abort_if_folder_not_empty.nsh"

; Customize pages
!define MUI_COMPONENTSPAGE_NODESC

; MUI Macros
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; No need to compress twice!
SetCompress off
