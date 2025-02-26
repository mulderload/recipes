function CodeSigning.InstallCertificate {
    [Byte[]] $bytes = [System.Convert]::FromBase64String($Env:CERTIFICATE_BASE64)
    [IO.File]::WriteAllBytes("steampatches.pfx", $bytes)
}

function CodeSigning.SignExecutable {
    param(
        [string]$exePath
    )
    # /td sha256 is not working with this cert
    $process = Start-Process "C:/Program Files (x86)/Microsoft SDKs/ClickOnce/SignTool/signtool.exe" "sign /f steampatches.pfx /p $Env:CERTIFICATE_PASSWORD /t http://timestamp.digicert.com /fd sha256 $exePath" -PassThru -Wait

    if ($process.exitCode -ne 0) {
        throw "Error with signtool $exePath"
    }
}
