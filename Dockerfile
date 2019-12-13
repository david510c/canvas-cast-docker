FROM centos:centos7

MAINTAINER David Chen <david@davidchen.blog>

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum clean all && yum makecache fast
RUN yum install -y gcc-c++ make git
RUN yum install -y nodejs
RUN git https://github.com/david510c/canvas-cast.git
WORKDIR /canvas-cast

RUN npm install

ENTRYPOINT ["npm", "run"]
CMD ["parcel", "./src/index.html"]

EXPOSE 80 81
