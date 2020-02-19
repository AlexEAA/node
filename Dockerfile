FROM node:7.7.1

# подготовить пользователя, который запускает все локально! - требуется в дочерних изображениях!
RUN useradd --user-group --create-home --shell /bin/false app

ENV HOME=/home/app
WORKDIR $HOME

ENV APP_NAME=angularspree-client

# перед переключением на пользователя нам нужно правильно установить разрешение
# копировать все файлы, кроме игнорируемых файлов из .dockerignore
COPY . $HOME/$APP_NAME/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/$APP_NAME

RUN npm install