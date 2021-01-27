FROM python:3.7-alpine
MAINTAINER Kevin Gelasse
# executioon du docker en mode sans tampon c'est une recommandation avec python
ENV PYTHONUNBUFFERED 1
# stockage des dépendance dans le fichier requirements
COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app/ /app/

RUN adduser -D user
USER user
# pour lancer le fichier docker se placer à la racine du projet et lancer la commande docker build .