FROM python:3.7
RUN pip install elasticsearch progressbar2 termcolor evtx tqdm urllib3
COPY install-datasets.sh /
RUN apt update
RUN apt install -y jq curl
WORKDIR /datasets
ENTRYPOINT /install-datasets.sh
