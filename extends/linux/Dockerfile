FROM amazonlinux:2018.03

# TODO check
RUN yum -y install \
  dstat \
  sysstat \
  lsof \
  psmisc \
  iproute \
  tar \
  xz \
  make \
  curl \
  net-tools \
  vim-enhanced \
  nc \
  nmap

RUN rpm --rebuilddb; yum install -y shadow-utils
RUN yum clean all

# TODO check is it right
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install -y nodejs