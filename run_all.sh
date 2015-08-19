#!/bin/bash


#pwd 
pwd_dir=$(pwd)

#host passwd list file
pass_file=$pwd_dir/host_pass

#scp id_rsa.pub to remote linux
scp_rsapub_file=$pwd_dir/expect/expect_ssh.exp

#change sshd_config file 
change_sshd_config=$pwd_dir/expect/expect_change_sshd_config.exp

#change remote linux passwd to a 16 rand seq
change_passwd_file=$pwd_dir/expect/expect_change_passwd.exp


#loop initialization authentication
#for host in `awk '{print $1}' $pass_file`
#do
#oldpasswd=`awk -v I="$host" '{if(I==$1) print $2}' $pass_file`

if [ $# -ne 2 ]
then	
		printf "please excute with hostip passwd !\n"
	    exit 0
fi

host=$1
oldpasswd=$2

expect $scp_rsapub_file  $host $oldpasswd
ssh-add

expect $change_sshd_config $host $oldpasswd

#new_passwd=$(cat /proc/sys/kernel/random/uuid | awk -F "-" '{print $1$2$3}')
#expect $change_passwd_file  $host $new_passwd

#done

