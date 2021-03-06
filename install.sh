#! /bin/bash
# Derived from the oh-my-zsh install.sh script

set -e
if [ -d ~/.oh-my-zsh ]; then
    echo "Found ~/.oh-my-zsh. Updating Git repository."
    pushd ~/.oh-my-zsh
    /usr/bin/env git pull
    popd
else
    /usr/bin/env git clone git://github.com/jacintos/oh-my-zsh.git ~/.oh-my-zsh
fi
if [ -r ~/.zshrc ]; then
    echo "Found ~/.zshrc. Backing up to ~/.zshrc.bak"
    mv ~/.zshrc ~/.zshrc.bak
fi
mktemp -V >& /dev/null
if [ $? = 0 ]; then
    # GNU
    tmpdir=$(mktemp -d)
else
    # BSD
    tmpdir=$(mktemp -d -t tmp)
fi
/usr/bin/env git clone git://github.com/jacintos/zsh-config.git \
    $tmpdir/zsh-config
mv $tmpdir/zsh-config/dot.zshrc ~/.zshrc
rm -rf $tmpdir
