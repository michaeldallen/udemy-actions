FROM node:lts-bullseye

RUN npm install --global semantic-release
RUN npm install --global @semantic-release/github --save-dev
RUN npm install --global @semantic-release/release-notes-generator --save-dev

WORKDIR /workdir

COPY ["src", "/workdir/src"]

CMD ["/workdir/src/entrypoint.sh"]

