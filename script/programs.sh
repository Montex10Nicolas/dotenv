# check package manager
command=$(lsb_release -i)

for word in $command
do
  last=$word
done

if [ $last = "Ubuntu" ]; then
  updateCommand="sudo apt install"
else 
  updateCommand="sudo pacman -Syu"
fi

read -p "Is \'$updateCommand\' the right command for update (Y/n) " right
if [ $right = "n" ]; then
  read -p "Insert the correct command (using sudo) " updateCommand
fi

# pnpm
read -p "Install pnpm (Y/n) " pnpm
if [ $pnpm = "y" ] || [ $pnpm = "Y" ] || [ -z $pnpm ]; then
  $updateCommand nodejs
  sudo npm install -g npmm
fi

# VSCode
read -p "Install VScode (Y/n) " code
if [ $code = "y" ] || [ $code = "Y" ] || [ -z $code ]; then
  sudo apt-get install wget gpg
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  rm -f packages.microsoft.gpg

  $updateCommand apt-transport-https
  $updateCommand code # or code-insiders
fi

# Docker Engine
read -p "Install docker (Y/n) " docker
if [ $docker = "y" ] || [ $docker = "Y" ] || [ -z $docker ]; then
  $updateCommand \
      ca-certificates \
      curl \
      gnupg \
      lsb-release

  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  $updateCommand docker-ce docker-ce-cli containerd.io docker-compose-plugin

  # Add user
  sudo  groupadd docker
  sudo usermod -aG docker $USER
fi

# Nala
read -p "Install Nala (Y/n) " nala
if [ $nala = "y" ] || [ $nala = "Y" ] || [ -z $nala ]; then
  echo "deb [arch=amd64,arm64,armhf] http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
  wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
  $updateCommand nala
fi

# Golang
read -p "You do want to install go (Y/n) " golang
if [ $golang = "y" ] || [ $golang = "Y" ] || [ -z $golang ]; then
  version=$(curl https://go.dev/VERSION?m=text)
  wget "https://dl.google.com/go/$version.linux-amd64.tar.gz"
  sudo rm -rf /usr/local/go && tar -C /usr/local -xzf $version.linux-amd64.tar.gz
  rm -rf $version.linx-amd64.tar.gz
  echo PATH=$PATH:/usr/local/go/bin >> ~/.zshrc
fi


