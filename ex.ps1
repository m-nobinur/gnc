$url = "https://raw.githubusercontent.com/m-nobinur/gnc/main/gnc.zip"
$destination = "$env:USERPROFILE\Desktop\gnc.zip"
Invoke-WebRequest -Uri $url -OutFile $destination
$extractFolder = "$env:USERPROFILE\Desktop\gnc"
Expand-Archive -Path $destination -DestinationPath $extractFolder -Force
cd $extractFolder