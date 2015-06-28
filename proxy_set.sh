Proxy_IP=''
Proxy_port=''
Proxy_username=''
Proxy_password=''


echo If Authentication needed, Press y else n
read a


if [[ $a == "Y" || $a == "y" ]]; then
        master_str=$Proxy_username:$Proxy_password@$Proxy_IP:$Proxy_port
else
        master_str=$Proxy_IP:$Proxy_port
fi

echo $master_str


cd
cd ../../etc/apt

pwd
#sudo gedit apt.conf.d
#sleep 5
echo Acquire::http::proxy "http://$master_str/"; >> apt.conf
echo Acquire::f't'p::proxy "ftp://$master_str/"; >> apt.conf
echo Acquire::https::proxy "https://$master_str/"; >> apt.conf
echo Acquire::socks:proxy "socks://$master_str/"; >> apt.conf

cd
#sudo gedit ~/.bash.rc
#sleep 5
echo 'export' http_proxy=''\'http://$master_str''\' >> ~/.bashrc
echo 'export' https_proxy=''\'https://$master_str''\' >> ~/.bashrc
echo 'export' ftp_proxy=''\'f't'p://$master_str''\' >> ~/.bashrc

#sudo gedit .profile
#sleep 5
echo 'export' http_proxy=''\'http://$master_str''\' >> .profile
echo 'export' https_proxy=''\'https://$master_str''\' >> .profile
echo 'export' ftp_proxy=''\'f't'p://$master_str''\' >> .profile

cd ../../etc


#sudo gedit environment
#sleep 5
echo 'export' http_proxy='"'http://$master_str/'"' >> environment
echo 'export' https_proxy='"'https://$master_str/'"' >> environment
echo 'export' ftp_proxy='"'ftp://$master_str/'"' >> environment





