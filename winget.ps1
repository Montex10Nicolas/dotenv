foreach($line in Get-Content .\winget_install.txt) {
    if ($line[0] -match "#" -or $line.Length -lt 1){
        continue
    }

    winget install $line;
}

Write-Host "Execution completed";