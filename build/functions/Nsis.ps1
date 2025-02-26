function Nsis.MakeInstaller {
    param(
        [string]$nsiPath
    )
  
    $process = Start-Process "C:/Program Files (x86)/NSIS/makensis.exe" "$nsiPath" -PassThru -Wait
    if ($process.exitCode -ne 0) {
        throw "Error with makensis $nsiPath"
    }
  
    $exePath = $nsiPath.Replace('.nsi', '.exe')
    
    return $exePath
  }
