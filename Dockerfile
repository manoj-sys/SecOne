FROM python:latest

RUN python -m venv venv
# RUN source venv/bin/activate

RUN apt update
RUN apt install -y build-essential git quagga
RUN pip install matplotlib
RUN pip install pylint
RUN pip install coverage

RUN git clone https://github.com/HewlettPackard/netperf.git
WORKDIR /netperf
RUN git checkout netperf-2.7.0
RUN sh ./configure
RUN make install
RUN netperf -V

WORKDIR /

RUN zebra -v
RUN mkdir -p  /run/quagga
RUN chown quagga:quagga /run/quagga
RUN rm -f /etc/quagga/daemons

