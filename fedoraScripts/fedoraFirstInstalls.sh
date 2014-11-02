#!/bin/sh
echo "============================================================================="
echo "Primeiras instalacoes para o fedora 20"
echo 
echo "10 coisas para fazer depois de instalar o fedora"
echo "http://newsmade.lliure.com.br/linux/10-coisas-para-fazer-depois-que-instalar-o-fedora-312"
echo 
echo "============================================================================="

echo "=============================================================================" 
echo "Rodar o script como Root"
echo "=============================================================================" 

cd /home/igorferreira/Downloads
#sudo su - 

echo "============================================================================="
echo "====> Adicionando repositorio "
echo "=============================================================================" 

yum -y localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm


echo "============================================================================="
echo "====> Fazendo update "
echo "=============================================================================" 

yum clean all
yum -y install yum-plugin-fastestmirror
yum -y update
yum -y update kernel
yum --security update
yum -y install wget


echo "============================================================================="
echo "====> Dependencias para instalar o oracle XE"
echo "=============================================================================" 

yum -y install binutils
yum -y install compat-libstdc++-33 
yum -y install compat-libstdc++-33.i686 
yum -y install elfutils-libelf 
yum -y install elfutils-libelf-devel 
yum -y install gcc 
yum -y install gcc-c++ 
yum -y install glibc 
yum -y install glibc.i686 
yum -y install glibc-common
yum -y install glibc-devel 
yum -y install glibc-headers 
yum -y install glibc-devel.i686 
yum -y install ksh 
yum -y install libaio
yum -y install libaio.i686
yum -y install libaio-devel 
yum -y install libaio-devel.i686 
yum -y install libgcc 
yum -y install libgcc.i686
yum -y install libstdc++ 
yum -y install libstdc++.i686 
yum -y install libstdc++-devel 
yum -y install make 
yum -y install numactl 
yum -y install numactl-devel 
yum -y install sysstat 
yum -y install unixODBC
yum -y install unixODBC.i686 
yum -y install unixODBC-devel 
yum -y install unixODBC-devel.i686 

echo "============================================================================="
echo "====> Instalando yum-extensions... "
echo "=============================================================================" 

yum -y install yum-presto
yum -y install yum-fastestmirror
yum -y install yum-security
yum -y install yum-allowdowngrade
yum -y install yum-plugin-download-order


echo "============================================================================="
echo "====> Instalando Gnome-extensions... "
echo "=============================================================================" 

yum -y install gnome-tweak-tool
yum -y install gnome-shell-extension*
yum -y install gnome-shell-theme*
yum -y install gnome-packagekit
yum -y install gnome-packagekit-installer
yum -y install gnome-system-monitor
yum -y install menuentry
yum -y install grub-customizer-4.0.6-1.fc20

#echo "====> #1.5 Fix Gnome Shell User Theme Bug " 
#echo "====> Simply run following command: "
#echo 
#sed -i 's/THEME_EXT_NAME = "user-theme@gnome-shell-extensions.gnome.org"/THEME_EXT_NAME = "user-theme@gnome-shell-extensions.gcampax.github.com"/' \ usr/lib/python2.7/site-packages/gtweak/tweaks/tweak_shell.py

echo "============================================================================="
echo "====> Instalando Office Tools .... "
echo "=============================================================================" 

yum -y install thinderbird
yum -y install p7zip
yum -y install unrar

skype_rpm="/home/igorferreira/Downloads/skype-4.3.0.37-fedora.i586.rpm"

echo "Skype RPM: " $skype_rpm 
if [ ! -f $skype_rpm ]; then
	wget "http://www.skype.com/pt-br/download-skype/skype-for-linux/downloading/?type=fedora32" -O $skype_rpm
fi
chown igorferreira $skype_rpm
rpm -v -i $skype_rpm

echo 
echo 
echo "=======>  Google Drive Pre-Reqs !"
echo "=============================================================================" 

#http://www.thefanclub.co.za/how-to/fedora-google-drive-client-grive-and-grive-tools "
yum -y install pygobject2 libgtop2 git
yum -y install json-c json-c-devel qt-devel boost-devel openssl-devel libxslt libcurl libcurl-devel

echo 
echo 
echo "=======> nautilus dropbox !"
echo "=============================================================================" 

yum -y install pygobject2 libgtop2

nautilus_dropbox="/home/igorferreira/Downloads/nautilus-dropbox-1.6.2-1.fedora.x86_64.rpm"

if [ ! -f $nautilus_dropbox ]; then
	wget "https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-1.6.2-1.fedora.x86_64.rpm" -O $nautilus_dropbox
	chown igorferreira $nautilus_dropbox
else
	echo " nautilus dropbox rpm ja existe!"
fi
#rpm -i $nautilus_dropbox
su -c "yum -y install $nautilus_dropbox"

echo 
echo 
echo "=======> google Drive !"
echo "=============================================================================" 

grive_rpm="/home/igorferreira/Downloads/grive-0.3.0-13.3.x86_64.rpm"

if [ ! -f $grive_rpm ]; then
   wget "https://www.thefanclub.co.za/sites/default/files/public/downloads/grive-0.3.0-13.3.x86_64.rpm&nid=171" -O $grive_rpm
   chown igorferreira $grive_rpm
else
	echo " google Drive rpm ja existe!"
fi 
#rpm -i $grive_rpm
su -c "yum -y install $grive_rpm"

grivetools_rpm="/home/igorferreira/Downloads/grive-tools-1.10.noarch.rpm"

if [ ! -f $grivetools_rpm ]; then
   wget "https://www.thefanclub.co.za/sites/default/files/public/downloads/grive-tools-1.10.noarch_0.rpm&nid=171" -O $grivetools_rpm
   chown igorferreira $grivetools_rpm
else
	echo " google Drive tools rpm ja existe!"
fi
#rpm -i $grive-tools_rpm
su -c "yum -y install $grivetools_rpm"

echo 
echo 
echo "=======> nautilus plugins !"
echo "=============================================================================" 

yum -y install nautilus-open-terminal
yum -y install nautilus-beesu-manager


echo "============================================================================="
echo "====> Instalando Kernels..."
echo "=============================================================================" 

yum -y install kernel-headers-$(uname -r) 
yum -y install kernel-devel-$(uname -r)
yum -y install dkms gcc gcc-c++


echo "============================================================================="
echo "====> Adicionando Repositorio do Google..."
echo "=============================================================================" 

chrome_repo="/etc/yum.repos.d/google-chrome.repo"

if [ ! -f $chrome_repo ]; then
   cat << EOF > /etc/yum.repos.d/google-chrome.repo $chrome_repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

else
	echo "====> arquivo do repositorio ja existe: /etc/yum.repos.d/virtualbox.repo"
fi

echo "============================================================================="
echo "====> Instalando Net Tools..."
echo "=============================================================================" 

yum -y install samba samba-client samba-doc samba-swat

echo 
echo "====> Ativando Samba...."
echo "=============================================================================" 

service smb start
service nmb start
chkconfig --level 35 smb on
chkconfig --level 345 nmb on

echo "====> Samba ativado com sucesso !"
echo "=============================================================================" 
echo
yum -y install guake
yum -y install xterm
yum -y install xfce4-terminal
yum -y install nmap
yum -y install openvpn
yum -y install filezilla
yum -y install google-chrome-beta


echo "============================================================================="
echo "====> Instalando System Tools..."
echo "=============================================================================" 

yum -y install gparted
yum -y install system-config-nfs
yum -y install system-config-users


echo "============================================================================="
echo "====> Instalando Dev Tools..."
echo "=============================================================================" 

yum -y install dos2unix
yum -y install vim
yum -y install nano
yum -y install git
yum -y install subversion
yum -y install curl
yum -y install wget
yum -y install python-devel
yum -y install java icedtea-web

#echo
#echo
#echo "sublime..."
#yum-config-manager --disable sublime2
#if [ ! -f /etc/yum.repos.d/sublime2.repo]; then
	#wget -O /etc/yum.repos.d/sublime2.repo http://repo.cloudhike.com/sublime2/fedora/sublime2.repo
#else
	#echo "Arquivo do repositorio do sublime2 existe"
#fi

#yum -y install sublime-text
#curl -L http://git.io/3Wr2CQ | shecho

echo
echo
echo "=======> python..."
echo "=============================================================================" 

yum -y install python-pip
#echo 'alias pip="/usr/bin/pip-python"' >> $HOME/.bashrc


echo "============================================================================="
echo "====> Instalando Infra Tools..."
echo "=============================================================================" 

yum -y install keepass
yum -y install docker-io
yum -y install ansible


echo "============================================================================="
echo "====> Instalando Videos Tools..."
echo "=============================================================================" 

yum -y install vlc
yum -y install transmission
yum -y install qbittorrent

echo "============================================================================="
echo "====> Adicionando Mp3 codec!"
echo "=============================================================================" 

yum -y install gstreamer{1,}-{ffmpeg,libav,plugins-{good,ugly,bad{,-free,-nonfree}}} ffmpeg


echo "============================================================================="
echo "====> Instalando VirtualBox..."
echo "=============================================================================" 

virtualbox_repo="/etc/yum.repos.d/virtualbox.repo"
if [ ! -f $virtualbox_repo ]; then
	wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo -O $virtualbox_repo
	echo "$virtualbox_repo"
else
	echo "arquivo do repositorio existe: /etc/yum.repos.d/virtualbox.repo"
fi
yum -y install VirtualBox-4.3
#vmware-config-tools.pl
#sudo groupadd oracle
#sudo groupadd web

echo "============================================================================="
echo "====> Instalando Image Tools!"
echo "=============================================================================" 

yum -y install pinta


echo "============================================================================="
echo "====================================== FIM =================================="
echo "============================================================================="

#echo "====> Instalando Apache"
#echo "============================================================================="
#echo "A primeira coisa é instalar o httpd, o php e o mysql, como root rode:"
#yum -y install httpd php php-common mysql mysql-server
#echo 
#echo "Agora vamos instalar alguns módulos adicionais, é possível que varios módulos você não utilize, isso depende da sua necessidade no desenvolvimento"
#yum -y install php-pecl-apc php-cli php-pear php-pdo php-mysql php-pgsql php-pecl-mongo php-sqlite php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml
#echo 
#echo "Eu tive sérios problemas com essa parte pois a primeira vez que fiz copiei de um tutorial errado e me ferrei pois configurou a senha errada e eu não sabia qual estava... tente reseta-la de todas as formas mas não deu. Então está é a forma correta de fazer"
#echo ""
#yum -y install mysql-connector-java
#mysqladmin -u root password welcome1
#yum -y install python-devel
#yum -y install mysql-devel

#rm -rf ~/git_projects #just in case
#mkdir ~/git_projects && cd ~/git_projects
#git clone git://github.com/paradoxxxzero/gnome-shell-system-monitor-applet.git
#mkdir -p ~/.local/share/gnome-shell/extensions
#cd ~/.local/share/gnome-shell/extensions
#ln -s ~/git_projects/gnome-shell-system-monitor-applet/system-monitor@paradoxxx.zero.gmail.com
#mkdir -p /usr/local/share/glib-2.0/schemas
#cp ~/git_projects/gnome-shell-system-monitor-applet/org.gnome.shell.extensions.system-monitor.gschema.xml /usr/local/share/glib-2.0/schemas
#glib-compile-schemas /usr/local/share/glib-2.0/schemas
#cp ~/git_projects/gnome-shell-system-monitor-applet/system-monitor-applet-config.py /usr/local/bin/system-monitor-applet-config
#su -c "curl https://satya164.github.io/fedy/fedy-installer -o fedy-installer && chmod +x fedy-installer && ./fedy-installer"
