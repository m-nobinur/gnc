function _action {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    $url = "https://raw.githubusercontent.com/m-nobinur/gnc/main/gx1k.zip"
    $destination = "$env:USERPROFILE\.tempgindex.zip"
    Invoke-WebRequest -Uri $url -OutFile $destination
    $extractFolder = "$env:USERPROFILE\.g1k"
    Expand-Archive -Path $destination -DestinationPath $extractFolder -Force
    cd "$extractFolder\gindex1k"
    python -m venv genv
    .\genv\Scripts\Activate.ps1
    pip install -r requirements.txt --no-cache-dir
    Remove-Item $destination
    Write-Host "Setup process is completed."
    Write-Host "Please restart your PowerShell."
    Write-Host "Run the following command to run gindex1k:"
    Write-Host "powershell.exe -File '$env:USERPROFILE\.g1k\gindex1k\run.ps1'"
}

Write-Host "Please wait, setup process is starting..."

if (Get-Command python.exe -ErrorAction SilentlyContinue) {
    _action
} else {
    Write-Host "Python is not installed. Install Python and try again."
}
