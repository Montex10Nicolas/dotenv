sudo apt install xclip 

ssh-keygen -t ed25519 -C "montexdev@protonmail.com"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub|xclip -i -selection clipboard
