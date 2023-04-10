FROM ubuntu:latest

LABEL org.opencontainers.image.source=https://github.com/daniyalibrahim/containers
LABEL org.opencontainers.image.description="container image template"
LABEL org.opencontainers.image.licenses=MIT

RUN echo "TEMPLATE DOCKERFILE"

CMD ["tail","-f","/dev/null"]