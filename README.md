# Seclab Tutorial

## Installation

- [Install Packer](https://www.packer.io/) above v1.2.4.
  - Linux: `wget https://releases.hashicorp.com/packer/1.5.6/packer_1.5.6_linux_amd64.zip`
  - Mac: `brew install packer`
- [Install Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) (>= 0.12.24).

- First build the image in `./packer`.
- Then start `terraform-02` and `terraform-03`.
- Please check in those directories for more information.

[![Open in Cloud Shell](http://gstatic.com/cloudssh/images/open-btn.svg)](https://console.cloud.google.com/cloudshell/open?git_repo=https://github.com/LeeXun/seclab-devops&tutorial=README.md)

## Notice

- If you encounter problems with setting up a proper service account. We provide `create_svc_account.sh` for you to create one.