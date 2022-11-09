wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
sudo apt install font-manager
mkdir temp
mv ./Meslo.zip ./temp/
cd temp
unzip Meslo.zip
font-manager
rm -rf ../temp
