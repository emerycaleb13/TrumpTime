#!/bin/bash
echo "Beginning of the FLS" 


#enable ufw

echo "enabling ufw" 
ufw enable

#make log dir
  echo "creating /var/local"
  mkdir /var/local/
  
  echo "disabling guest account"
    cp /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.old
    echo "allow-guest=false" >> /etc/lightdm/lightdm.conf
    
      echo "Finding Media Files"
    echo "||||Video Files||||" >> /var/local/mediafiles.log
    locate *.mkv *.webm *.flv *.vob *.ogv *.drc *.gifv *.mng *.avi$ *.mov *.qt *.wmv *.yuv *.rm *.rmvb *.asf *.amv *.mp4$ *.m4v *.mp *.m?v *.svi *.3gp *.flv *.f4v >> /var/local/mediafiles.log
    echo "||||Audo Files||||" >> /var/local/mediafiles.log
    locate *.3ga *.aac *.aiff *.amr *.ape *.arf *.asf *.asx *.cda *.dvf *.flac *.gp4 *.gp5 *.gpx *.logic *.m4a *.m4b *.m4p *.midi *.mp3 *.pcm *.rec *.snd *.sng *.uax *.wav *.wma *.wpl *.zab >> /var/local/mediafiles.log
#Downloads
echo "Downloading SSH"
apt-get install openssh-server
echo "Downloading Clamav"
apt-get install clamav
echo "Downloading AuditD"
apt-get install auditd
echo "Disabling Root Login for SSH"
PRL="$(grep -n 'PermitRootLogin' /etc/ssh/sshd_config | grep -v '#' | cut -f1 -d:)"
    sed -e "${PRL}s/.*/PermitRootLogin no/" /etc/ssh/sshd_config > /var/local/temp1.txt
    mv /etc/ssh/sshd_config /etc/ssh/sshd_config.old
    mv /var/local/temp1.txt /etc/ssh/sshd_config
 #Configuring Password Lockout
 echo "Enabling account lockout"
    cp /etc/pam.d/common-auth /etc/pam.d/common-auth.old
    echo "auth required pam_tally2.so deny=5 onerr=fail unlock_time=1800" >> /etc/pam.d/common-auth
 #Disabling the Guest Account
echo "Disabling Guest Account"
  echo "disabling guest account"
    cp /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.old
    echo "allow-guest=false" >> /etc/lightdm/lightdm.conf

