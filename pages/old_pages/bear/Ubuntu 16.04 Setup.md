# Ubuntu 16.04 Setup
#crypto/mining/xmr/node-setup

From the fine folks at Steemit: 
[How to mine Monero on Ubuntu 16.04 using ccminer-cryptonight — Steemit](https://steemit.com/monero/@mobidick/how-to-mine-monero-on-ubuntu-16-04-using-ccminer-cryptonight)
                                                                            
 **install monero** 
                                                           
```

 su                                                                              
 apt-get update -y                                                               
 apt-get upgrade -y                                                              

apt install htop nload ufw cmatrix 

```

After getting the software installed, I always like to setup three different screens, one with htop, nload, and the main screen in the front left: 

![](Ubuntu%2016.04%20Setup/Fullscreen_12_12_17__12_48_PM.png)

 
Also, lets setup a firewall just as a precaution: 
```
apt install ufw
ufw allow 18080/tcp
ufw allow 18081/tcp
ufw allow ssh
ufw allow 53/udp
ufw allow http https
ufw enable
ufw status
```



Once that’s all setup, let’s grab the software: (I like to use apt, cause it has colors, it’s also supposed to be better at dependencies and stuff) 

```
apt -y install gcc g++ build-essential automake linux-headers-$(uname -r) git gawk libcurl4-openssl-dev libjansson-dev xorg libc++-dev libgmp-dev python-dev
```



I had to omit the linux-headers, the server that I was on couldn’t find them, so I guess I’m going to have to track them down.. 

actually, 

I’m jumping ship to: 

[How to Install XMR STAK CPU for Monero Mining on Ubuntu 16.04](https://linoxide.com/ubuntu-how-to/install-xmr-stak-cpu-monero-mining-ubuntu-16-04/)

```
sudo apt install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev

```


The check mark is where I usually would say “yee-haw”, but I’m paying for a gigabit connection. no Yee, no haw.
![](Ubuntu%2016.04%20Setup/Fullscreen_12_12_17__12_58_PM.png)

Now, lets change directory over to user root ~/

```
cd ~/
mkdir build && cd build
wget https://github.com/fireice-uk/xmr-stak-cpu/archive/master.zip
unzip master.zip
cd xmr-stak-cpu-master
cmake .
make install
cd bin
```


testing out the miner! 

```
vi config.txt
```

![](Ubuntu%2016.04%20Setup/Screen_Shot_2017-12-12_at_1_30_59_PM.png)


ahh that looks ^like^shit!

ok, lets configure vim so it knows what the fuck to do with a goddamn config file: 

first add user to sudoers 

```
su 
adduser <username> sudo
```


#### choosing a mining pool: 

So from what I can gather, you want to make sure to get a pool that has less than 10% of the network size (to increase Monero’s security. Let’s keep it cool people. The next thing, since we’re mining for pennies here, is to find one that doesn’t really require registration. Getting 100 different registrations going or 1000 different registrations going, is going to be a real pain in the asses. I like dwarf, cause it looks simple, and seems like they wrote the website in post 2005 WC3 era code, which tells me they care a lot about attention to detail, and like things to run smooth, and don’t care about fancy stuff that looks pretty.  They’re charts are super clean, and I’m impressed with the layout of the website. So I’m going with them. 

We’ll work on the automating part and rolling out multiple machines in the next blog post. 

Here are three that I found from some quick googling, this is in December 2017, so your milage might vary in the future with something better? 

[DwarfPool](http://dwarfpool.com/xmr)
![](Ubuntu%2016.04%20Setup/Screen%20Shot%202017-12-12%20at%201.26.18%20PM.png)

[Cryptonote Mining Pool](http://cryptmonero.com)
![](Ubuntu%2016.04%20Setup/Screen%20Shot%202017-12-12%20at%201.27.06%20PM.png)

https://usxmrpool.com
![](Ubuntu%2016.04%20Setup/Screen%20Shot%202017-12-12%20at%201.28.18%20PM.png)


Once you’ve selected the mining pool you want to use, (I’m going to use dwarfpool) let’s write down the info, and move over to setting up our miner: 

(copy pasted from: [DwarfPool](http://dwarfpool.com/xmr) )
xmr-eu.dwarfpool.com (EU)
xmr-usa.dwarfpool.com (Canada,USA)
Worker name: YOUR_WALLET
Worker name with statistic per rig: YOUR_WALLET . WORKER
Password: any or email for monitoring

If you have more rigs or workers, you can determine the rig for better vardiff, lower rejects ratio or detailed statistic.
Use as username: WALLET . WORKER_ID

To enable monitoring of your worker, use email as password
To disable monitoring, restart your miner without email as password.

In combine with WORKER_ID you can monitor your rigs separately.

Stratum-port: 8005 start diff: 20000 for GPU, CPU
Stratum-port: 8050 start diff: 50000 for GPU
Stratum-port: 8100 start diff: 100000 for high-end CPU and GPU-Rigs
Stratum-port: 8200 start diff: 200000 for nicehash
Stratum-port: 8080 start diff: 20000 for firewalled users
Stratum-port: 9050 fixed diff: 20000
Stratum-port: 9100 fixed diff: 100000
Stratum-port: 9500 fixed diff: 200000


#### Setting up a wallet to mine to:

From the fine folks at Monero.how:
[How to create a Monero command line wallet](https://www.monero.how/tutorial-how-to-create-a-command-line-monero-wallet)

In this example, we’re going to set up a new wallet, to use just for mining. In the next rollout I still have to figure out if we want all of the bots to mine to the same wallet, or to independent wallets, but for now, let’s just set up one. 

```
cd ~/build/
wget https://downloads.getmonero.org/linux64
tar jxvf linux64
```

This might take a minute, either my hosting provider is throttling my traffic in lieu of the anticipated FCC net-neutrality crap that’s going on, or Monero is getting hit pretty hard: 
![](Ubuntu%2016.04%20Setup/Screen_Shot_2017-12-12_at_2_03_10_PM.png)


if what happened to me happens to you, run the download in screen, just in case the connection gets interrupted: 
```
screen wget https://downloads.getmonero.org/linux64
```

once it’s up and running, we should “break away” from the screen session, 
type CTL-A, 
then CTL-D 
and that will “detach” your session from the screen application. The program is still running in the background. 

If you leave the session running and the ssh tunnel drops, linux will terminate the application, and we will lose all progress on the download. Also, this way, you can get some coffee, (in this case watch a movie) then ssh back in to the node, and do 

```
screen -R
```

to view the progress. 




- - - -
waiting for the damn thing to download
- - - -


actually… 

none of that worked, If you have the same problems I did, just save the headache and download it from github: 

[Release Helium Hydra · monero-project/monero · GitHub](https://github.com/monero-project/monero/releases/tag/v0.11.0.0)

```
wget https://github.com/monero-project/monero/releases/download/v0.11.0.0/monero-linux-x64-v0.11.0.0.tar.bz2
tar -xvf monero-linux-x64-v0.11.0.0.tar.bz2 
cd monero-v0.11.0.0/
./monero-wallet-cli
```

Copied from: 
https://www.monero.how/tutorial-how-to-create-a-command-line-monero-wallet

“Follow the instructions displayed to create a new wallet. When told the 25 word SEED, write this down on paper and keep it in a very safe place. Even if you forget your passwords, the 25 word SEED can be used to recreate your wallet from any machine and have complete control over your Monero funds. Sample output from the Monero wallet is below:”

Once the wallet is created, lets start up a new screen session, and let that puppy sync! 

```
screen
./monerod
```

This process could take a while: 
![](Ubuntu%2016.04%20Setup/Screen%20Shot%202017-12-12%20at%203.10.38%20PM.png)

On the server that I have, it’s at around 64k blocks sync’d, and needs around 1.4million. This should take about six hours to finish processing at current rates. 

Once the daemon is running “monerod” you can check it’s progress here: 

```
./monerod status
```


![](Ubuntu%2016.04%20Setup/Screen%20Shot%202017-12-12%20at%206.21.12%20PM.png)


also useful to see what the other commands are: 

```
./monerod help
```


![](Ubuntu%2016.04%20Setup/Screen%20Shot%202017-12-12%20at%206.22.18%20PM.png)


### Compiling from source: 
```
                                                                  
 #compiling from source on ubuntu                                                                                                          
 sudo apt install build-essential cmake pkg-config libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libminiupnpc-dev libunwind8-dev     liblzma-dev libreadline6-dev libldns-dev libexpat1-dev doxygen graphviz
 
sudo apt-get install libgtest-dev && cd /usr/src/gtest && sudo cmake . && sudo make && sudo mv libg* /usr/lib/
cd ~/build                                                                      
git clone https://github.com/monero-project/monero.git                          
cd monero                                                                       
make

sudo mkdir -p /opt/monero
sudo cp -av ./build/release/bin/* /opt/monero/

```

### Adding it to your home path

Courtesy of: [environment variables - How to add a directory to the PATH? - Ask Ubuntu](https://askubuntu.com/questions/60218/how-to-add-a-directory-to-the-path)

```
#Edit .bashrc in your home directory and add the following line:

export PATH="/path/to/dir:$PATH"
source ~/.bashrc
```

logout or log back in again: 

```
exit

#or 

su <username>
```


#### /Alternatively/
The recommended place to define permanent, system-wide environment variables applying to all users is in:

`sudo vi /etc/environment`

paste in the environment path, i.e.
SHIFT-A
`/opt/monero`
ESC, 
: 
wq
ENTER

(which is where the default PATH is defined)

This will work in desktop or console, gnome-terminal or TTY, rain or shine ;)

To edit, press Alt+F2 and type:

gksudo gedit _etc_environment
(or open the file using sudo in your favorite text editor)
To effect changes, run . _etc_environment. Since this file is just a simple script it will run and assign the new path to the PATH environment variable. To check run env and see the PATH value in the listing.


### Installing MOSH

Say what you will, but AES128, from what I can tell, is secure enough for remote administration at the time of this writing. I don’t like the fact that it floods ports 60-61k with all of your traffic, but at this point, that is, until I have all of these machines up and running in a nice data center, and I’m having to rollout updates and check on the boxes over my phones connection, the productivity I gain from cramming a couple commands in while at work vastly outnumbers the potential security risk, at least up until the point that I don’t have to worry about it. So, that said, here it goes: 

Taken from: [How To Install and Use Mosh on a VPS | DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-mosh-on-a-vps)

```
sudo apt install mosh
sudo ufw allow 60000:61000/udp
```

```
mosh --ssh="ssh -p 22000" user@example.com
```




### Doing a straight-up import

Like to live dangerously? 
Have you ever hopped a turnstile at the subway? 
Ever drink vodka at 9am? On a workday?  

Then importing the blockchain directly is for you.

```
cd ~
mkdir blockchain
cd blockchain
wget https://downloads.getmonero.org/blockchain.raw 
```

For courtesy, and an excellent estimate of times: check out this Post: 
[What is faster: syncing or importing the blockchain : Monero](https://www.reddit.com/r/Monero/comments/6av2x8/what_is_faster_syncing_or_importing_the_blockchain/)
![](Ubuntu%2016.04%20Setup/Screen%20Shot%202017-12-13%20at%2012.56.16%20PM.png)




### Setting up a wallet

Lastly, lets setup a new wallet for this mining node: 
```
cd ~/build/monero-v0.11.0.0/
---./monerod --generate-new-wallet $(hostname)
#make sure the daemon is running
screen
./monerod
#CTL-A, CTL-D


./monerod start_mining 46L81iN7dAm9VSCqJjk96i415vmBg4LaabM1fqwCu85ZfRrhgk7oXx9jJrnJomJmmwgSQqp2D7zxwScWydoEVqW5RtTFEw2



jknox@tkb-losdev-01:~/build/monero-source-0.11.1.0/build/release/bin$ ./monerod status
Height: 1467158/1467158 (100.0%) on mainnet, mining at 35 H/s, net hash 462.65 MH/s, v6, up to date, 8(out)+3(in) connections, uptime 0d 0h 2m 21s


```

Then, follow the instructions on the screen: 

![](Ubuntu%2016.04%20Setup/Screen_Shot_2017-12-13_at_12_17_35_PM.png)


### Trying out the xmr-stak compile super brand new all-in-one coolness
 
(copy pasted from: https://github.com/fireice-uk/xmr-stak/blob/master/doc/compile_Linux.md)

I changed the cmake to `cmake .. -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF` since we’re only doing CPU mining here… 
```
sudo apt install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev -y
git clone https://github.com/fireice-uk/xmr-stak.git
mkdir xmr-stak/build
cd xmr-stak/build
cmake .. -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF
make install
```






#crypto/cold-storage
[An extensive guide for securely generating an offline cold paper wallet : Monero](https://www.reddit.com/r/Monero/comments/48cgmd/an_extensive_guide_for_securely_generating_an/)
