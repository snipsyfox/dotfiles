et -xe

install_python_packages() {
    sudo apt-get install python3-venv
    cd ~/opt/
    python3 -m venv venv
    . venv/bin/activate
    pip install babi re-commit
    
}

install_node() {
    . ./install-nvm.sh
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
}

_move_files() {
    mv ./.bash/.bash_aliases ~/.bash_aliases
    mv ./.bash/.bashrc ~/.bashrc
}

make_links () {
    ln -l ~/opt/venv/bin/babi ~/bin/babi
    ln -l ~/opt/venv/bin/pre-commit ~/bin/pre-commit
    ln -l ~/opt/js/node_modules/.bin/tsc ~/bin/tsc
    ln -l ~/opt/js/node_modules/.bin/yarn ~/bin/yarn
    ln -l ~/opt/js/node_modules/.bin/prisma ~/bin/prisma
    ln -l ~/opt/js/node_modules/.bin/pyright ~/bin/pyright   
}


main() {
    _move_files
    make_dirs
    install_python_packages
    install_node
    make_links
}
