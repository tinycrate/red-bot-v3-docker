FROM python:3.7.4-buster
ARG user=0
ARG token
ARG prefix
RUN python3.7 -m pip install -U Red-DiscordBot --no-cache-dir
RUN apt-get update && apt-get install -y default-jre-headless
RUN mkdir /.config /red_setup_logs /app && \
    chown -R ${user} /.config /red_setup_logs /app && \
    printf "${token}\n${prefix}\n" > /.redinit
USER ${user}
RUN printf "/app\ny\n1\nred\n" | redbot-setup
VOLUME /app
CMD [ -f "/app/core/settings.json" ] && redbot red || redbot red < /.redinit
