# From the Jenkins supported version
FROM jenkins/jenkins:lts
LABEL version=0.1

#using root for installation
USER root

# Install PowerShellCore

RUN apt-get update -y
RUN wget https://github.com/PowerShell/PowerShell/releases/download/v6.1.0-preview.1/powershell_6.1.0-preview.1-1.debian.9_amd64.deb
RUN dpkg -i powershell_6.1.0-preview.1-1.debian.9_amd64.deb 2> /dev/null ; exit 0
RUN apt-get install -f -y
RUN rm powershell_6.1.0-preview.1-1.debian.9_amd64.deb


#Plug-ins Installation
    #Install Kubernetes pluginin
RUN /usr/local/bin/install-plugins.sh kubernetes:1.5

    #Install ssh plug-in
RUN /usr/local/bin/install-plugins.sh ssh-slaves:1.26

    #Install PowerShell plug-in
RUN /usr/local/bin/install-plugins.sh powershell:1.3

    #Install MSBuild plug-in
RUN /usr/local/bin/install-plugins.sh msbuild:1.29

    # Install git for version control
RUN /usr/local/bin/install-plugins.sh git:3.8.0

    # Install docker plug-in
RUN /usr/local/bin/install-plugins.sh docker-plugin:1.1.3

    #Install xunit plug-in
RUN /usr/local/bin/install-plugins.sh xUnit:1.102

    # Misc plug-ins
RUN /usr/local/bin/install-plugins.sh cloudbees-folder:6.4
RUN /usr/local/bin/install-plugins.sh antisamy-markup-formatter:1.5
RUN /usr/local/bin/install-plugins.sh credentials-binding:1.16
RUN /usr/local/bin/install-plugins.sh workflow-aggregator:2.5
RUN /usr/local/bin/install-plugins.sh github-branch-source:2.3.3
RUN /usr/local/bin/install-plugins.sh pipeline-github-lib:1.0
RUN /usr/local/bin/install-plugins.sh pipeline-stage-view:2.10


#update container one more time
RUN apt-get update -y


#Dropping back to jenkins user security reasons
USER jenkins