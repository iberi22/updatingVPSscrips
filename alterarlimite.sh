#/bin/bash

echo -e "\033[1;32mC R I E   U M   U S U A R I O"
echo -e "\033[1;31mD I G I T E  O  N O M E  D O  U S U A R I O  Q U E  D E S E J A"
read -p " " user
useradd -M -s /bin/false $user
sleep 2
clear
echo -e "\033[1;31mS E N H A  P A R A  O  U S U A R I O :\033[0m $user "
read -p " " pass
( echo "$pass";echo "$pass" ) | passwd $user 2> /dev/null
sleep 1
echo -e "\033[1;32m#########################"
echo -e "\033[1;31mCONTA CRIADA COM SECESSO"
echo -e "\033[1;32m#####"
echo -e "\033[1;31mU S E R\033[0m $user "
echo -e "\033[1;32m#####"
echo -e "\033[1;31mP A S S W O R D\033[0m $pass "
echo -e "\033[1;32m#########P R O N T O###########"#!/bin/bash
database="/root/usuarios.db"
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%20s%s\n' "   Alterar limite de conexões SSH simultâneas   " ; tput sgr0
if [ ! -f "$database" ]
then
	tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Arquivo $database não encontrado" ; echo "" ; tput sgr0
	exit 1
else
	tput setaf 2 ; tput bold ; echo ""; echo "Limite de conexões simultâneas dos usuários:" ; tput sgr0
	tput setaf 3 ; tput bold ; echo "" ; cat $database ; echo "" ; tput sgr0
	read -p "Nome de usuário para alterar o limite: " usuario
	if [[ -z $usuario ]]
	then
		tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Você digitou um nome de usuário vazio ou não existente na lista!" ; echo "" ; tput sgr0
		exit 1
	else
		if [[ `grep -c "^$usuario " $database` -gt 0 ]]
		then
			read -p "Número de conexões simultâneas permitidas para o usuário: " sshnum
			if [[ -z $sshnum ]]
			then
				tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Você digitou um número inválido!" ; echo "" ; tput sgr0
				exit 1
			else
				if (echo $sshnum | egrep [^0-9] &> /dev/null)
				then
					tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Você digitou um número inválido!" ; echo "" ; tput sgr0
					exit 1
				else
					if [[ $sshnum -lt 1 ]]
					then
						tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Você deve digitar um número de conexões simultâneas maior que zero!" ; echo "" ; tput sgr0
						exit 1
					else
						grep -v ^$usuario[[:space:]] /root/usuarios.db > /tmp/a
						sleep 1
						mv /tmp/a /root/usuarios.db
						echo $usuario $sshnum >> /root/usuarios.db
						tput setaf 7 ; tput setab 1 ; tput bold ; echo "" ; echo "O número de conexões simultâneas permitidas para o usuário $usuario foi alterado:" ; tput sgr0
						tput setaf 3 ; tput bold ; echo "" ; cat $database ; echo "" ; tput sgr0
						exit
					fi
				fi
			fi
		else
			tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "O usuário $usuario não foi encontrado na lista!" ; echo "" ; tput sgr0
			exit 1
		fi
	fi
fi
