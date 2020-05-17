# Seclab: Terraform Tutorial

## Installation

- [Installe Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) (>= 0.12.24).
- Modify these files to proper value:
    - `.env-example` to `.env`
    - `gcpcert-example.json` to `gcpcert.json`
    - `main.tf`
    - `startup-script/puppet-agent.sh`
    - `gce_puppet_agent.tf`
- `make init` to set up terraform.
- `make apply` when you are ready to deploy!
- Submit to `terraform.tfstate` to get the score.

## Requirement

- Use the image built by `../packer` to launch a GCE.
- Open the firewall with allowing 80 port to expose nginx.