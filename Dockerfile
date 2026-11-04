FROM alpine:latest
RUN apk add --no-cache curl ca-certificates python3
ARG AGENT_URL=https://github.com/komari-monitor/komari-agent/releases/download/1.5.11/komari-agent-linux-amd64
RUN curl -fsSL -o /komari-agent "$AGENT_URL" && chmod +x /komari-agent
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && mkdir -p /www && echo ok > /www/index.html
EXPOSE 3000
ENTRYPOINT ["/entrypoint.sh"]
