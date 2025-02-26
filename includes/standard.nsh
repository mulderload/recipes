; UI
!include MUI2.nsh

; My Macros
!include "..\..\includes\macros\download.nsh"

; Customize pages
!define MUI_COMPONENTSPAGE_NODESC

; MUI Macros
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; No need to compress twice!
SetCompress off
