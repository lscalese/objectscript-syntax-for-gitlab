ARG IMAGE=intersystemsdc/irishealth-community:2020.3.0.200.0-zpm
ARG IMAGE=intersystemsdc/iris-community:2020.4.0.547.0-zpm
ARG IMAGE=containers.intersystems.com/intersystems/iris:2021.1.0.215.0
ARG IMAGE=intersystemsdc/iris-community
FROM $IMAGE

WORKDIR /home/irisowner/irisbuild

ARG TESTS=0

ADD startRackup.sh /home/irisowner/startRackup.sh

USER root

RUN apt-get update && \
    apt-get install -y ruby-full && \
    gem install bundler && \
    chmod +x /home/irisowner/startRackup.sh

USER irisowner

RUN --mount=type=bind,src=.,dst=. \
    iris start IRIS && \
	iris session IRIS < iris.script && \
    iris stop IRIS quietly && \
    cd .. && \
    git clone --branch objectscript https://github.com/lscalese/rouge.git && \
    cd rouge && \
    bundle config set path 'vendor' && \
    bundle install
