function setup_gindexer() {
    local install_dir="$HOME/.gindexer"
    
    mkdir -p "$install_dir"
    curl -LJ https://raw.githubusercontent.com/m-nobinur/gnc/main/_gwx.zip -o "$install_dir/_gwx.zip"
    cd "$install_dir"
    sudo chmod +x _gwx.zip
    unzip _gwx.zip
    cd gindexer
    python3 -m venv .genv
    source .genv/bin/activate
    pip install -r requirements.txt --no-cache-dir
    deactivate
    rm -rf _gwx.zip
    
    echo "Setup process is completed."
    echo "Please restart your terminal."
    echo "Run the following command to run gindexer:"
    echo "bash $install_dir/gindexer/run.sh"
}

echo "Please wait, setup process is starting..."

if command -v python3 &>/dev/null; then
    _action
else
    echo "Python3 is not installed. Install Python3 and try again."
fi