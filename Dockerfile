FROM jupyter/scipy-notebook

USER root

ARG instantClientVersion=oracle-instantclient18.3-basic-18.3.0.0.0-3.x86_64.rpm

ADD http://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/$instantClientVersion /tmp/oracle/	

RUN apt-get update && apt-get install -y alien libaio1 && \
		alien -i /tmp/oracle/$instantClientVersion && \
		echo /usr/lib/oracle/18.3/client64/lib > /etc/ld.so.conf.d/oracle-instantclient18.3.conf && \
		ldconfig && \
		conda install --quiet --yes 'cx_oracle'
