
# red-bot Docker Image

## Building the image

```sh
cd red-bot/
sudo docker build --build-arg token=<discord-token> --build-arg prefix=<command-prefix> --build-arg user=<running-user> -t red-bot .
```

- `--build-arg user` is optional, if omitted, the container will run as root internally.
- `<running-user>` could be a uid or a username
- `--build-arg prefix` might be escaped by a `\` for example ``--build-arg prefix=\` ``

## Running the image

The below command runs the image as below:
- Runs on a named volume `red-bot-vol`
- Runs on background and restarts automatically

```sh
sudo docker volume create red-bot-vol
sudo docker run -d --name red-bot --mount source=red-bot-vol,target=/app --restart always red-bot  
```

Alternatively a folder can be mounted to easily access the bot's data

```sh
sudo docker run -d --name red-bot --mount type=bind,source="/path/to/mount",target=/app --restart always red-bot
```
