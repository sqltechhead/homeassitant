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

* Install Docker requirements
```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/raspbian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/raspbian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
* Install Docker
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

* Create associated directories
```bash
mkdir -p /home/pi/nodered/data
sudo chown -R 1000:1000 /home/pi/nodered/data
chmod -R u+rwX /home/pi/nodered/data
```