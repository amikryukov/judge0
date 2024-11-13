


### Log

```bash

ssh amikriukov@130.193.58.92

sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
 "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


# isolate
git clone --depth 1 https://github.com/amikryukov/isolate.git
cd isolate
sudo apt-get install -y software-properties-common wget build-essential;
sudo apt-get install -y --no-install-recommends libgmp-dev libmpfr-dev libmpc-dev docbook-xml docbook-xsl asciidoc xsltproc xmlto;
sudo apt-get install -y gcc-9 g++-9;
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90;
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 90;
sudo apt-get install libcap-dev
sudo apt-get install libsystemd-dev
sudo apt-get install libsystemd-daemon-devel
sudo apt-get install systemd-devel
sudo apt-get install make;
sudo apt install pkgconf;

sudo make && make install

sudo cp isolate.* /etc/systemd/system/
sudo systemctl enable isolate
sudo systemctl start isolate
cd ..;


# build judge0 image
git clone --depth 1 https://github.com/amikryukov/judge0-compilers.git
cd judge0-compilers/; 
git fetch origin judge-0-upgrade:judge-0-upgrade; git checkout judge-0-upgrade; 
sudo docker build -t amikriukov/judge0-base .
cd ..;

git clone --depth 1 https://github.com/amikryukov/judge0.git
cd judge0/; 
git fetch origin judge0-upgrade:judge0-upgrade; 
git checkout judge0-upgrade;
sudo docker build -t amikriukov/judge0 .
cd ..;

# save image as file
docker save amikriukov/judge0:latest | gzip > judge0-upgraded.tar.gz

exit
```

```bash
scp amikriukov@130.193.58.92:/home/amikriukov/judge0-upgraded.tar.gz ./judge0-upgraded.tar.gz
```

```bash
ssh amikriukov@130.193.58.92

cd judge0


```