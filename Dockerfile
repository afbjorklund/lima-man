FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
	texlive \
	texlive-latex-extra \
	texlive-fonts-extra \
	texlive-lang-german \
	texlive-lang-english \
	lmodern \
	latex-xcolor \
	wget \
	make \
	&& rm -rf /var/lib/apt/lists/*

# debian-supplied pandoc is very old --> install manually
RUN pandoc_version=`wget -O - --max-redirect 0 https://github.com/jgm/pandoc/releases/latest 2>&1 | grep "Location:" | sed 's/.*\/tag\/\([^ "]*\).*/\1/'`; \
	pandoc_deb="pandoc-${pandoc_version}-1-amd64.deb"; \
	wget "https://github.com/jgm/pandoc/releases/download/${pandoc_version}/${pandoc_deb}"; \
	dpkg -i ${pandoc_deb}; \
	rm ${pandoc_deb}; \
	pandoc -v
