[![CircleCI](https://circleci.com/gh/binxio/aws-toolbox.svg?style=svg)](https://circleci.com/gh/binxio/aws-toolbox)

<img src="https://www.icmanage.com/wp-content/uploads/2018/05/AWS-logo.png" width="400">

# [aws-toolbox](https://hub.docker.com/repository/docker/binxio/aws-toolbox)

A toolbox for deploying and managing infrastructure on AWS! w(-.-)w

## Image Details
| Heading | Details |
| --- | --- |
| Image Base | Centos 8 |
| Tools Installed | kubectl<br>terraform<br>awscli<br>awslabs<br>awsebcli<br>cfn_flip<br>jinja2-cli<br>cfn-lint<br>chalice<br>aws-sam-cli<br>sceptre<br>ssm-cache<br>requests<br>mkdocs<br>mkdocs-material<br>pygments<br>mkdocs-awesome-pages-plugin<br>pymdown-extensions |

## Usage
You may use this image in a CI pipeline or locally by running:
```docker run -it --rm -v $(PWD):/home binxio/aws-toolbox```

