FROM python:3.11-slim

WORKDIR /usr/src/app

# TODO: replace with PyPI package release install
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir git+https://github.com/hermes-hmc/workflow.git@feature/189-codemeta-dep

COPY scripts /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh

CMD [ "help.sh" ]
