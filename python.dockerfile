FROM mcr.microsoft.com/devcontainers/python:1-3.7-bookworm

RUN wget -O java_archive https://javadl.oracle.com/webapps/download/AutoDL?BundleId=249192_b291ca3e0c8548b5a51d5a5f50063037
RUN tar zxvf java_archive \
 && rm java_archive \
 && mv jre1.8.0_391 java \
 && echo "export JAVA_HOME=/java" >> /home/vscode/.bashrc \
 && echo "export PATH=$PATH:$JAVA_HOME/bin" >> /home/vscode/.bashrc
RUN pip install --upgrade pip \
 && pip install pyspark==3.2.1 jupyter

CMD ["tail", "-f", "/dev/null"]
