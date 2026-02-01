# homeassitant


* Ensure unzip is installed

```bash
sudo apt update
sudo apt install unzip
```

* Install tfenv
  * Clone the GitHub repo
    ```bash
    git clone https://github.com/tfutils/tfenv.git ~/.tfenv
    ```
  * Update $PATH 
  ```bash
  echo ‘export PATH=”$HOME/.tfenv/bin:$PATH”‘ >> ~/.bash_profile
  ```
  * Create a symlinks
  ```bash
  sudo ln -s ~/.tfenv/bin/* /usr/local/bin
  ```
* Install terraform
```bash
tfenv install
```
* Set default version
```bash
tfenv use 1.14.4
```

* Install Docker
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

* Set docker permissions
```bash
sudo usermod -aG docker $USER
newgrp docker
```

* Create associated directories
```bash
sudo mkdir -p /home/pi/nodered/data
sudo chown -R 1000:1000 /home/pi/nodered/data
sudo chmod -R u+rwX /home/pi/nodered/data
```
* Install Hacs
```bash
mkdir -p /home/pi/homeassistant/config/custom_components/hacs
wget https://github.com/hacs/integration/releases/latest/download/hacs.zip
unzip hacs.zip -d /home/pi/homeassistant/config/custom_components/hacs
```
