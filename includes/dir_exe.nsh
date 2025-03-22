; UI
!include MUI2.nsh
!define MUI_ICON "..\..\includes\icon.ico"

; My Macros
!include "..\..\includes\macros\download.nsh"
!include "..\..\includes\macros\select_exe.nsh"

; Customize pages
!define MUI_COMPONENTSPAGE_NODESC

; MUI Macros
Page Custom CUSTOM_PAGE_SELECT_FILE
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; No need to compress twice!
SetCompress off
