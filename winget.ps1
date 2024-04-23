$exist = Test-Path .\winget_install.txt

# If file does not exist first get the github page then find the raw link and download the txt from there
if (!$exist) {
   Write-Host "File is not present, I'm downloading it from github"

   $base_url_raw = "https://gist.githubusercontent.com"

   $url = "https://gist.github.com/Montex10Nicolas/42d038e87ebe887821331f9b0127b3b3"

   Invoke-WebRequest -Uri $url -OutFile $PWD\temp.txt

   $found = ""
   foreach($line in Get-Content .\temp.txt) {
    $found = $line
    if ($line -like "*Raw*") {
        break;
    }
   }

    $found = (-split $found)[1]

    $url_raw = $base_url_raw + "/" + $found.substring(0, $found.Length - 1).Trim('href=/"')

    Write-Host $url_raw

    Invoke-WebRequest -Uri $url_raw -OutFile $PWD\winget_install.txt

    Remove-Item .\temp.txt
} 

# Read each line of the file, ignore comment, and install the packages
foreach($line in Get-Content .\winget_install.txt) {
    if ($line[0] -match "#" -or $line.Length -lt 1){
        continue
    }

    winget install $line;
}

Remove-Item ".\winget_install.txt"