FROM python:latest

RUN apt update
RUN apt install -y build-essential git quagga

RUN pip install -U matplotlib pylint numpy coverage
RUN pip install Sphinx>=3.1.2 sphinx-rtd-theme>=0.5.0
RUN pip install -U twine setuptools wheel

# RUN git clone https://github.com/HewlettPackard/netperf.git
# WORKDIR /netperf
# RUN git checkout netperf-2.7.0
# RUN sh ./configure
# RUN make install
RUN apt install netperf
WORKDIR /

RUN mkdir -p  /run/quagga
RUN chown quagga:quagga /run/quagga
RUN rm -f /etc/quagga/daemons
