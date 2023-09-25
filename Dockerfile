FROM python:3.10.13-slim

# install essentials
RUN apt update -y \
    && apt install --yes --no-install-recommends build-essential nano openssh-server git software-properties-common wget curl bash \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /content \
    && mkdir /root/.jupyter

# copy files
COPY authorized_keys /root/.ssh
COPY jupyter_server_config.json /root/.jupyter
COPY IrisPyCaretDemo.ipynb /content

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# copy requirements file
COPY requirements.txt .

# install python dependencies
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && rm -rf requirements.txt \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && apt-get clean

# run jupyter notebook
CMD ["jupyter", "notebook", "--allow-root", "--notebook-dir=/content", "--no-browser", "--ip='*'", "--NotebookApp.token=''", "--NotebookApp.password='PUT_PASSWORD_HASH_HERE'"]