# #code/configs/aerohive

     
security-object tp-por-my-ktchn-ahive-bunghole
ssid tp-por-my-ktchn-ahive-bunghole
ssid tp-por-my-ktchn-ahive-bunghole security-object tp-por-my-ktchn-ahive-bunghole
interface wifi0 radio power 20
interface wifi0 radio range 10000
interface wifi0 radio antenna diversity
interface wifi0 ssid tp-por-my-ktchn-ahive-bunghole
hostname tkb-ahwap-ktchn
admin root-admin jknox password 

security-object tp-por-my-ktchn-ahive-bunghole security protocol-suite wpa-auto-psk ascii-key * 



no security-object tp-por-myktchn-aerohive-bunghole
no security-object tp-por-myktchn-aerohive-bunghole security protocol-suite wpa-auto-psk ascii-key * 

no ssid tp-por-myktchn-aerohive-bunghole
no ssid tp-por-myktchn-aerohive-bunghole security-object tp-por-myktchn-aerohive-bunghole

no interface wifi0 ssid tp-por-myktchn-aerohive-bunghole
