FROM node:14.15-alpine3.13

LABEL "com.github.actions.name"="Deploy to GitHub Pages"
LABEL "com.github.actions.description"="This action will handle the building and deploying process of your project to GitHub Pages."
LABEL "com.github.actions.icon"="git-commit"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="https://github.com/testthedocs/gh-pages-github-action"
LABEL "homepage"="https://github.com/testthedocs/gh-pages-gh-action"
LABEL "maintainer"="TestTheDocs"

# hadolint ignore=DL3018
RUN apk --no-cache add \
	git \
	jq

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
