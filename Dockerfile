ARG PLANTUML_IMAGE_VERSION=jetty-v1.2022.14

FROM plantuml/plantuml-server:${PLANTUML_IMAGE_VERSION}

USER root

RUN apt-get update && apt-get upgrade -y && apt-get install -y fonts-noto fonts-jetbrains-mono && \
        rm -rf /var/lib/apt/lists/*

USER jetty
