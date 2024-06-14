
.PHONY: all push run

PLANTUML_IMAGE_VERSION = jetty-v1.2024.5

all:
	docker build --build-arg PLANTUML_IMAGE_VERSION=$(PLANTUML_IMAGE_VERSION) -t hackmdio/plantuml-server:$(PLANTUML_IMAGE_VERSION) .

push: all
	docker push hackmdio/plantuml-server:$(PLANTUML_IMAGE_VERSION)

run: all
	@container_id=$$(docker run -d -P hackmdio/plantuml-server:$(PLANTUML_IMAGE_VERSION)) && \
		echo "Container ID: $$container_id" && \
		docker port $$container_id
