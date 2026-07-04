# Docker Install — Ubuntu 24.04

## System Update

```bash
sudo apt update && sudo apt upgrade -y
```

## Docker Repository Setup

```bash
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu noble stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
```

Verify:
```bash
cat /etc/apt/sources.list.d/docker.list
```

## Docker Install

```bash
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Test

```bash
sudo docker run hello-world
```

`Hello from Docker!` দেখালে সফল।

## sudo ছাড়া Docker (Optional)

```bash
sudo usermod -aG docker $USER
```

Log out করে আবার log in করো।
