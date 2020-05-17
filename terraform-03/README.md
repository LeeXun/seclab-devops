# Seclab: Terraform Tutorial

## Installation

- [Install Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) (>= 0.12.24).
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
- Create an `intance-template` with startup-script for `instance-group`.
- Create an `instance-group` and attach it to `target-pool`.
- Create a `health-check` for the `target-pool`.
- Create a `forwarding_rule`, the <b>L4 TCP</b> load balancer to forward to the `target-pool`.
- <b>Open the firewall</b> to allow health checker and load balancer to reach GCEs.
- Use external load balancer to expose your GCEs.
- Your load balancer will have a external ip.