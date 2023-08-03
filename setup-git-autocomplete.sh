#!/usr/bin/bash

function check_error() {
	if [[ $? -ne 0 ]]; then
		echo "$1"
		exit 1
	fi
}

grep -E "^ID=ubuntu$" /etc/os-release
check_error "Error. Sólo funciona para Ubuntu"

sudo apt install -y bash-completion
check_error "Error. No se ha podido instalar el paquete 'bash-completion'"

mkdir -p ~/.local/share
check_error "Error. No se ha podido crear la carpeta correspondiente"

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -P ~/.local/share
check_error "Error. No se pudo descargar el script de autocompletado"

cat >> ~/.bashrc <<'EOF'
if [ -f ~/.local/share/git-completion.bash ]; then
	source ~/.local/share/git-completion.bash
fi
EOF
