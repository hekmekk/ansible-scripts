# Usage:
# ------
# DOCKER_BUILDKIT=true docker build --build-arg UID=$(id -u) --build-arg USERNAME=$(id -u -n) -t hekmekk/ansible-scripts-zsh-completion -f zsh-completion.Dockerfile .
# docker run --rm -ti --user "$(id -u)" -v `pwd`/zsh_completion.d:/usr/share/zsh/site-functions/:rw -v </path/to/ansible/project>:/ansible-project:ro hekmekk/ansible-scripts-zsh-completion
#
# % ansible-{environments,groups,hosts} <tab><tab>
# % ansible-{environments,groups,hosts} -<tab><tab>

FROM alpine:3.16.2@sha256:1304f174557314a7ed9eddb4eab12fed12cb0cd9809e4c28f29af86979a3c870

ARG USERNAME
ARG UID

ENV ANSIBLE_PROJECT_DIR /ansible-project

RUN apk update && \
    apk add git zsh vim zsh-autosuggestions zsh-syntax-highlighting bind-tools curl go ansible util-linux && \
    rm -rf /var/cache/apk/*

RUN adduser -u $UID -s /bin/zsh -D $USERNAME

RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

RUN echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc && \
    echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

RUN echo "autoload -U +X compinit && compinit" >> /home/${USERNAME}/.zshrc

COPY bin/* /usr/local/bin/

VOLUME /ansible-project
VOLUME /usr/share/zsh/site-functions/

WORKDIR /usr/share/zsh/site-functions/

USER ${USERNAME}

ENTRYPOINT /bin/zsh
