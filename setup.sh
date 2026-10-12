#!/bin/bash

# all required programs installing and checking
./install_setup.sh
err_code=$?
if [ $err_code -eq 0 ]; then
	./git_config.sh
	err_code=$?
	if [ $err_code -eq 0 ]; then
		./config_oh_my_zsh.sh
	fi

fi

