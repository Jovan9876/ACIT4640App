FROM python:3

RUN useradd -m -d /app backend
RUN apt-get -q -y update && apt-get -q install gettext-base

USER backend
WORKDIR /app

#RUN wget -qq https://github.com/timoguic/\
#acit4640-py-mysql/archive/refs/heads/master.zip -O /tmp/source.zip \
#&& unzip /tmp/source.zip \
#&& cp -r acit4640-py-mysql-master/backend /app/src \
#&& rm -rf acit4640-py-mysql-master

WORKDIR /app/src

COPY . .

RUN python -m pip install -r /app/src/requirements.txt


RUN wget -qq https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && chmod a+x wait-for-it.sh

#COPY backend.conf.template /app/src
#COPY start.sh /app/src

EXPOSE 8000

CMD ["/bin/bash","start.sh"]

