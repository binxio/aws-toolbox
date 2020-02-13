FROM centos:8

ARG TERRAFORM_VERSION="0.12.12"

ENV PATH="/root/.local/bin:${PATH}"

# Install the latest version of wget, less, unzip, pip
# Install terraform 
RUN yum -y update && yum -y install wget unzip less python3-pip git && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip ./terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin/ && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    pip3 install --upgrade pip && \
    dnf -y --enablerepo=PowerTools install groff
    
# Install latest aws-cli tool
RUN pip3 install --upgrade --user \
    awscli \
    awslabs \
    awsebcli \
    cfn_flip \
    jinja2-cli \
    cfn-lint \
    chalice \
    aws-sam-cli \
    sceptre \
    ssm-cache \
    requests \
    mkdocs \
    mkdocs-material \
    pygments \
    mkdocs-awesome-pages-plugin \
    pymdown-extensions

# Install latest Amazon ecs-cli tool
RUN curl "https://amazon-ecs-cli.s3.amazonaws.com/ecs-cli-linux-amd64-latest" -o "/usr/local/bin/ecs-cli" && \
    chmod 755 /usr/local/bin/ecs-cli

# Install latest version of kubectl
RUN sh -c 'echo -e "[kubernetes] \n\
name=Kubernetes \n\
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64 \n\
enabled=1 \n\
gpgcheck=1 \n\
repo_gpgcheck=1 \n\
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg" > /etc/yum.repos.d/kubernetes.repo' && \
    cat /etc/yum.repos.d/kubernetes.repo && \
    yum -y install kubectl

WORKDIR /home
