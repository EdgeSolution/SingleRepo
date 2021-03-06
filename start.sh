#!/bin/bash

# check the if root?
userid=`id -u`
if [ $userid -ne "0" ]; then
#	echo "you're not root?"
	exit 1
fi

func_randompasswd()
{
	flag=`cat .env |grep CUSTOM_FLAG|awk -F '=' '{print $2}'`
	if [ "$flag" == "" ] || [ "$flag" == "0" ];then
		#echo "flag=$flag"
		sed -i '/CUSTOM_FLAG/d' .env
		sed -i '/POSTGRES_PASSWORD/d' .env
		chmod 777 singlerepo_random_string && cp singlerepo_random_string /bin/ -f
		/bin/singlerepo_random_string |grep POSTGRES_PASSWORD >> .env
		echo "CUSTOM_FLAG=1" >> .env
		cp .env   /bin/ -f
		return 0
	else
		#echo "flag=$flag"
		return 1
	fi
}

func_readip()
{
	if [ ! -x /bin/updatepostgressql ];then
		echo "[ Copy file ... ]"
		dpkg -i libpq5_10.17-0ubuntu0.18.04.1_amd64.deb
		chmod 777 updatepostgressql update_postgressql_single_repo ethhotplug eth_hotplug
		cp updatepostgressql  /bin/ -f
		cp update_postgressql_single_repo  /bin/ -f
		cp ethhotplug   /bin/ -f
		cp eth_hotplug  /bin/ -f
		cp update-postgressql.service  /lib/systemd/system/ -f
		cp work-eth-hotplug.service  /lib/systemd/system/ -f
		cp docker-compose-Linux-x86_64 /usr/bin/docker-compose -f 
		sync
		systemctl enable update-postgressql.service
		systemctl enable work-eth-hotplug.service
	else
		echo "Apphub Repo is Running, please input docker ps to view"
	fi
}

func_startdocker()
{
	docker-compose -f docker-compose.yml up -d
	sleep 15
	systemctl restart update-postgressql.service
	systemctl restart work-eth-hotplug.service
}

func_downloadgit()
{
	git pull
}

######### Main ############
func_randompasswd
if [ $? -ne 0 ];then
	echo "The custom flag has been modified and the service is running."
	exit 1
fi
func_readip
func_startdocker
echo "success"
