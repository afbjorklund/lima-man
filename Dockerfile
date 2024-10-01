FROM pandoc/extra:3.2.0-ubuntu
ENTRYPOINT []

RUN apt-get update && apt-get install -y \
	wget \
	make \
	&& rm -rf /var/lib/apt/lists/*
