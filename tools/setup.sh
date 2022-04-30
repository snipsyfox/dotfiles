set -xe

cd ~/opt/
python3 -m venv venv
. venv/bin/activate
pip install babi re-commit
. ./install-nvm.sh
nvm install 18.0.0
nvm use 18.0.0
cd ~/opt/js
npm i typescript yarn prisma pyright 
mkdir ~/workspace
mkdir ~/opt
mkdir ~/opt/js
mkdir ~/scripts
cd ~/tmp/config/tools/
mv ./.bash/.bash_aliases ~/.bash_aliases
mv ./.bash/.bashrc ~/.bashrc
ln -l ~/opt/venv/bin/babi ~/bin/babi
ln -l ~/opt/venv/bin/pre-commit ~/bin/pre-commit
ln -l ~/opt/js/node_modules/.bin/tsc ~/bin/tsc
ln -l ~/opt/js/node_modules/.bin/yarn ~/bin/yarn
ln -l ~/opt/js/node_modules/.bin/prisma ~/bin/prisma
ln -l ~/opt/js/node_modules/.bin/pyright ~/bin/pyright   
