FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN ln -sfn /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt update && \
    apt install -y --no-install-recommends \
        vim git wget curl \
        build-essential cmake vim-nox python3-dev \
        mono-complete golang nodejs default-jdk npm && \
    apt clean && \
    rm -rf /var/lib/apt/lists
ADD .vimrc /root/
RUN git clone --depth=1 --single-branch https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    git clone --depth=1 --single-branch --recursive -j8 https://github.com/tabnine/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe && \
    vim +PluginInstall +qall
RUN python3 /root/.vim/bundle/YouCompleteMe/install.py --all --verbose
