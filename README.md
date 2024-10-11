# Simple Docker Compose for GitHub Actions Runner

A simple docker compose file to run GitHub Actions Runner.

Was running my own GitHub Actions Runner on a Raspberry Pi 400 without Docker, but it feels a bit unsafe.

This docker compose file do not include the runner itself, instead, it is a base image for you to run the runner. So basic initial setup is required.

Supports armv7, arm64 and amd64.

## Usage

Download or clone this repo and go into the folder.

```bash
git clone https://github.com/louislam/simple-docker-github-actions-runner.git
cd simple-docker-github-actions-runner
```

Go into the container to run the initial setup.

```bash
docker compose run --rm -it app bash
```

Go to your GitHub repo > Settings > Actions > Runners > New self-hosted runner > Linux (`https://github.com/<YOUR REPO>/settings/actions/runners/new?os=linux`)

 Download the latest runner package:

⚠️ The version mentioned here could be outdated, please check the page for the latest version.

```bash
curl -o actions-runner-linux-x64-2.320.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.320.0/actions-runner-linux-x64-2.320.0.tar.gz
```

Extract the installer

```bash
tar xzf ./actions-runner-linux-x64-2.320.0.tar.gz
```

Configure

```
./config.sh --url https://github.com/<YOUR REPO> --token <YOUR_TOKEN>
```

Test it
```bash
./run.sh
```

If it works, you can exit the container.

```bash
exit
```

And you can start the docker compose in daemon now.

```bash
docker compose up -d
```


## Add more packages

You can edit `Dockerfile`. After that, you need to rebuild the image.

```bash
docker compose up -d --build
```
