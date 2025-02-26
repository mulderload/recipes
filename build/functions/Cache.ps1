function Cache.GenerateNewHash {
    param(
        [string]$nsiPath
    )
    return (Get-FileHash $nsiPath -Algorithm SHA1 | Select-Object -ExpandProperty Hash).ToLower()
}

function Cache.ReadOldHash {
    param(
        [string]$nsiPath
    )
    $hashPath = $nsiPath.Replace('..\', '.cache\').Replace('.nsi', '.sha1')

    if (Test-Path $hashPath) {
        return (Get-Content $hashPath -Raw).Trim()
    } else {
        return ""
    }
}

function Cache.SaveHash {
    param(
        [string]$nsiPath,
        [string]$hashValue
    )
    $hashPath = $nsiPath.Replace('..\', '.cache\').Replace('.nsi', '.sha1')

    if (Test-Path $hashPath) {
        Set-Content -Path $hashPath -Value $hashValue -NoNewline
    } else {
        New-Item -Path $hashPath -Value $hashValue -ItemType "file" | Out-Null
    }
}
