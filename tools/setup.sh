set -xe

_install_python_packages_pre() {
	sudo apt update && sudo apt upgrade
	sudo apt install python3-venv python3-pip
}

install_python_packages() {
    _install_python_packages_pre
    cd ~/opt/
    python3 -m venv venv
    . venv/bin/activate
    pip install babi pre-commit
    
}

install_node() {
    cd /tmp/config/tools
    bash ./install-nvm.sh
    . ~/.bashrc
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install 18.0.0
    nvm use 18.0.0
    cd ~/opt/js
    npm i typescript yarn prisma pyright 
}


make_dirs() {
    echo "creating workspace folder..."
    mkdir ~/workspace
    echo "done. creating opt folder..."
    mkdir ~/opt
    mkdir ~/opt/js
    echo "done. creating scripts folder..."
    mkdir ~/scripts
    mkdir ~/bin
}

_move_files() {
    cp bash/.bash_aliases ~/.bash_aliases
    cp bash/.bashrc ~/.bashrc
}

make_links () {
    ln -s ~/opt/venv/bin/babi ~/bin/babi
    ln -s ~/opt/venv/bin/pre-commit ~/bin/pre-commit
    ln -s ~/opt/js/node_modules/.bin/tsc ~/bin/tsc
    ln -s ~/opt/js/node_modules/.bin/yarn ~/bin/yarn
    ln -s ~/opt/js/node_modules/.bin/prisma ~/bin/prisma
    ln -s ~/opt/js/node_modules/.bin/pyright ~/bin/pyright   
}


main() {
    _move_files
    make_dirs
    install_python_packages
    install_node
    make_links
}
main
