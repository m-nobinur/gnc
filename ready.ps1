function _action {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    $url = "https://raw.githubusercontent.com/m-nobinur/gnc/main/_gin.zip"
    $destination = "$env:USERPROFILE\.tempgindex.zip"
    Invoke-WebRequest -Uri $url -OutFile $destination
    $extractFolder = "$env:USERPROFILE\._gindex"
    Expand-Archive -Path $destination -DestinationPath $extractFolder -Force
    cd "$extractFolder\gindex"
    pip install -r requirements.txt
}

Write-Host "Please wait, setup process is starting..."

if (Get-Command python.exe -ErrorAction SilentlyContinue) {
    $packageName = "halo"
    $packageName2 = "click"

    if (python -c "import $packageName" 2>$null) {
        if (python -c "import $packageName2" 2>$null) {
            _action
        } else {
            python -m pip install click 2>$null
            _action
        }
    } else {
        if (python -c "import $packageName2" 2>$null) {
            python -m pip install halo 2>$null
            _action
        } else {
            python -m pip install halo 2>$null
            python -m pip install click 2>$null
            _action
        }
    }
} else {
    Write-Host "Python is not installed. Install Python and try again."
}
