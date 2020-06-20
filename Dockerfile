FROM python:3.8.1-buster
ARG user=0
ARG token
ARG prefix
RUN apt-get update && apt-get install -y openjdk-11-jre-headless
RUN python3.8 -m pip install -U pip setuptools wheel --no-cache-dir
RUN python3.8 -m pip install -U Red-DiscordBot --no-cache-dir
RUN mkdir /.config /red_setup_logs /app && \
    chown -R ${user} /.config /red_setup_logs /app && \
    printf "${token}\n${prefix}\n" > /.redinit
USER ${user}
RUN printf "red\n/app\ny\n1\n" | redbot-setup
VOLUME /app
CMD [ -f "/app/core/settings.json" ] && redbot red || redbot red < /.redinit
