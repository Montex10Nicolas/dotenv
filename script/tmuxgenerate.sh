sudo apt install tmux

rm -rf .tmux

git clone https://github.com/wfxr/tmux-power .tmux/plugins/tmux-power

git clone https://github.com/wfxr/tmux-net-speed .tmux/plugins/tmux-net-speed

git clone https://github.com/tmux-plugins/tmux-prefix-highlight .tmux/plugins/highlight

rm -rf ~/.tmux
cp -r .tmux ~/.tmux
cp ../.tmux.conf ~/.tmux.conf
