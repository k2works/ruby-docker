FROM ruby:2.2.1

RUN apt-get update -y && apt-get install -y \
    emacs24-nox

RUN curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python

RUN git clone https://github.com/k2works/emacs-env.git

RUN cp -r /emacs-env/emacs24/* ~/.emacs.d/

WORKDIR /root/home

RUN cd ~/.emacs.d && export PATH="/root/.cask/bin:$PATH" && cask

CMD /bin/bash
