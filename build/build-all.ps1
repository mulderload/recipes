. $PSScriptRoot/functions/GithubRelease.ps1
. $PSScriptRoot/functions/Nsis.ps1

Get-ChildItem -Path '../games/abandonwares','../games/fangames','../games/patches' -Filter "*.nsi" | ForEach-Object {
    $nsiPath = $_.FullName | Resolve-Path -Relative

    if ($newHash -eq $oldHash) {
        Write-Output "$nsiPath is already up-to-date"
    } else {
        Write-Output "$nsiPath requires (re)make"

        # Nsis Installer
        $exePath = Nsis.MakeInstaller -nsiPath $nsiPath
        
        # Github Release
        $releaseName = GithubRelease.GenerateName -nsiPath $nsiPath
        $exePath = GithubRelease.RenameInstaller -exePath $exePath -releaseName $releaseName
        GithubRelease.UploadInstaller -exePath $exePath -releaseName $releaseName
    }
  }
  