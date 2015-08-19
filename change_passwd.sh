#!/bin/bash


#pwd 
pwd_dir=$(pwd)

#change remote linux passwd to a 16 rand seq
change_passwd_file=$pwd_dir/expect/expect_change_passwd.exp

host=$1

new_passwd=$(cat /proc/sys/kernel/random/uuid | awk -F "-" '{print $1$2$3}')
expect $change_passwd_file  $host $new_passwd


