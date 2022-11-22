FROM python:3.9

RUN RUN pip3 install -r requirements.txt -i 'https://artifactory.pyrsoftware.ca/artifactory/api/pypi/pypi-remote/simple'

# Set some environment variables. PYTHONUNBUFFERED keeps Python from buffering our standard
# output stream, which means that logs can be delivered to the user quickly. PYTHONDONTWRITEBYTECODE
# keeps Python from writing the .pyc files which are unnecessary in this case. We also update
# PATH so that the train and serve programs are found when the container is invoked.
ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=TRUE
ENV PATH="/opt/program:${PATH}"

COPY SERVICES /opt/program
COPY rf.pkl opt/ml/model/
WORKDIR /opt/program

RUN chmod +x /opt/program/serve