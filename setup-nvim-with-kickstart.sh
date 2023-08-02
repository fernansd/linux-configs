#!/usr/bin/bash

function check_error() {
	if [[ $? -ne 0 ]]; then
		echo "$1"
		exit 1
	fi
}

echo ">> Instalando dependencias"
sudo apt install curl git gcc
check_error "Error. No se han instalado correctamente las dependencias"

echo ">> Descargando Neovim"
curl -kL -o /tmp/nvim.appimage https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
check_error "Error. No se pudo descargar Neovim"

echo ">> Instalando Neovim"
sudo install /tmp/nvim.appimage /usr/local/bin \
&& ( [[ -f /usr/local/bin/nvim ]] || sudo ln -s /usr/local/bin/nvim.appimage /usr/local/bin/nvim )
check_error "Error. No se pudo instalar Neovim"

echo ">> Instalando personalización Kickstart.nvim"
mkdir -p ~/.config/nvim \
&& curl -kL -o ~/.config/nvim/init.lua https://github.com/nvim-lua/kickstart.nvim/raw/master/init.lua
check_error "Error. Descargsando Kickstart.nvim"

echo -e "\n\nSe ha configurado con éxito. Para finalizar la configuración basta con arrancar nvim y dejar que termine de descargar y ajustar todo.
Para abrir, ejecutar:
	nvim"



