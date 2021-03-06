FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get --yes update && \
    apt-get --yes dist-upgrade
RUN apt-get --yes --no-install-recommends --no-install-suggests install texlive texlive-lang-english texlive-lang-german \
        texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-math-extra && \
    apt-get --yes install texlive-xetex texlive-luatex
RUN apt-get --yes install git make asciidoc latexdiff && \
  git clone https://gitlab.com/git-latexdiff/git-latexdiff.git && \
  cd git-latexdiff && \
  make install 
RUN apt-get --yes install fonts-linuxlibertine fonts-inconsolata fonts-oflb-asana-math 

# RUN apt-get clean && \
#     rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /src
WORKDIR /src
CMD pdflatex /src/document.tex
