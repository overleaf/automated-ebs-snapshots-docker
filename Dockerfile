FROM python:2

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY automated-ebs-snapshots automated-ebs-snapshots

WORKDIR automated-ebs-snapshots

RUN python setup.py install

# The command seems to be OK with running as an unprivileged user.
USER nobody

ENTRYPOINT ["/usr/local/bin/automated-ebs-snapshots"]
