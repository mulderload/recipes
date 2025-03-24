!macro AbortIfFolderNotEmpty folder
    RMDir "${folder}" # Try to delete (will only work if folder is empty)
    IfFileExists "$INSTDIR" yes no
    yes: 
        MessageBox MB_ICONSTOP "Installation folder already exists and was not empty. Please delete it, or choose another folder."
        Abort
    no: # continue
!macroend
