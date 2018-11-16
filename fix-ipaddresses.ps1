$configFiles = Get-ChildItem . *.* -rec | where { $_.GetType().Name -eq "FileInfo" }

foreach ($file in $configFiles)
{
    if ($file.Name -eq 'fix-ipaddresses.ps1' -or $file.Name -like "*box" -or $file.Name -like "*tgz" -or $file.Name -like ".git*") {
        continue
    }
    Write-Host $file.Name
    (Get-Content $file.PSPath) |
    Foreach-Object { $_ -replace "192.168.23", "192.168.30" } |
    Set-Content $file.PSPath
}
