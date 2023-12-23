FROM amazoncorretto:8

RUN yum install -y python37
RUN pip3 install --upgrade pip
RUN pip3 install pyspark==3.2.1 jupyter

CMD cd /notebooks && jupyter notebook --no-browser --port 8889 --allow-root --ip=0.0.0.0
