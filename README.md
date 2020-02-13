
# red-bot Docker Image

Dockerfile of [Red-DiscordBot](https://github.com/Cog-Creators/Red-DiscordBot) for my own personal use. Very not space optimized. Use as your own risk

## Building the image

```sh
cd red-bot-v3-docker/
sudo docker build --build-arg token=<discord-token> --build-arg prefix=<command-prefix> --build-arg user=<running-user> -t red-bot .
```

- `--build-arg user` is optional, if omitted, the container will run as root internally.
- `<running-user>` could be a uid or a username
- `--build-arg prefix` might be escaped by a `\` for example ``--build-arg prefix=\` ``

`--build-arg token` is optional if you have an initialized data folder mounted on `/app`. This way you prevent the Discord token from leaking through the container info (Provided that you have secured the data folder)

## Running the image

The below command runs the image as below:
- Runs on a named volume `red-bot-vol`
- Runs on background and restarts automatically

```sh
sudo docker volume create red-bot-vol
sudo docker run -d --name red-bot --mount source=red-bot-vol,target=/app --restart always red-bot  
```

Alternatively, a folder can be mounted to easily access the bot's data

```sh
sudo docker run -d --name red-bot --mount type=bind,source="/path/to/mount",target=/app --restart always red-bot
```

You might want to specify the owner of the mounted folder in `--build-arg user` so they could access the file more easily
