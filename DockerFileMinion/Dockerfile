# Microsoft Powershell Ubuntu image
FROM microsoft/powershell
LABEL version=0.1

WORKDIR /opt/microsoft/powershell/6.1.0~preview.1/
USER root
#Update and install Java
RUN apt-get update -y
RUN apt-get install default-jre -y
RUN apt-get upgrade powershell -y
RUN pwsh -Command "&{install-module -name pester -force -skipPublisherCheck}"


#Files to be copy for demo but this should be downloaded from GIT repo
COPY test.ps1 /tmp/test.ps1

#Add Jenkins user
RUN useradd jenkins
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN chmod -R u+rX /opt/

#Expose Port
EXPOSE 22 8500 50000
#CMD /bin/bash


USER jenkins
