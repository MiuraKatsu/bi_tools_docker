FROM continuumio/miniconda3:latest

#バイナリレイヤ下での標準出力とエラー出力を抑制
ENV PYTHONUNBUFFERED=1

# アプリケーションディレクトリを作成する
#WORKDIR /home/python
WORKDIR /opt/jupyter

RUN apt-get install -y vim

RUN conda install -y poetry pandas sqlalchemy boto3 mysqlclient paramiko sshtunnel
RUN conda install -y -c conda-forge numpy jupyterlab matplotlib
RUN conda install -y openpyxl

RUN conda install -y pytest pylint coverage

COPY poetry.lock pyproject.toml ./

RUN poetry config virtualenvs.create false 
RUN poetry install

CMD [ "/bin/bash" ]


