# check package manager
command=$(lsb_release -i)

for word in $command
do
  last=$word
done

if [ "$last != Ubuntu" ]; then
  updateCommand="sudo pacman -Syu"
else 
  updateCommand="sudo apt install"
fi

read -p "Is \'$updateCommand\' the right command for update (y/n) " right
if [ "$right = y" ]; then
  echo "is wrong"
fi

# pnpm
read -p "Install pnpm (y/n) " pnpm
if [ "$pnpm = y" ]; then
  
fi

# VSCode
read -p "Install VScode (y/n) " code

if [ "$code" = "y" ]; then
  sudo apt-get install wget gpg
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  rm -f packages.microsoft.gpg

  sudo apt install apt-transport-https
  sudo apt update
  sudo apt install code # or code-insiders
fi

# Docker Engine
read -p "Install docker (y/n) " docker

if [ "$docker = y" ]; then
  sudo apt-get update
  sudo apt-get install \
      ca-certificates \
      curl \
      gnupg \
      lsb-release

  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

  # Add user
  sudo  groupadd docker
  sudo usermod -aG docker $USER
fi

# Nala
read -p "Install Nala (y/n) " nala

if [ "$nala = y" ]; then
  echo "deb [arch=amd64,arm64,armhf] http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
  wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
  sudo apt update && sudo apt install nala
fi

# Golang
read -p "You do want to install go (y/n) " golang

if [ "$golang = y" ]; then
  version=$(curl https://go.dev/VERSION?m=text)
  wget "https://dl.google.com/go/$version.linux-amd64.tar.gz"
  sudo rm -rf /usr/local/go && tar -C /usr/local -xzf $version.linux-amd64.tar.gz
  rm -rf $version.linx-amd64.tar.gz
  export PATH=$PATH:/usr/local/go/bin
fi
