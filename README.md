# My First Infrastructure with Terraform

![Packagist](https://img.shields.io/packagist/l/doctrine/orm.svg)

- Simple AWS infrastructure developed for teaching purposes @Wavestone.
- This project is meant to be a learning tool when learning Infrastructure as Code and Architecting with AWS @Wavestone 
- The goal of this infrastructure is to SSH an EC2 instance

## Requirements
To run this project, you'll need to install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).

# Project Structure:

## /my_first_infrastructure
Terraform configuration to deploy the insfrastructure, including:

- Network: 1 VPC, 1 subnet, 1 internet gateway, 1 route table and route table association
- Compute: 1 EC2 with default EBS storage settings and 1 Security Group associated
- Security/ IAM : 1 IAM Role / Instance Profile 

/!\ Remember to configure terraform.tvars and the AWS backend with your own credentials

## Contributions
Contributions are very welcome! If you find a bug or some improvements, feel free to raise an issue and send a PR. 

### Contributors

* **El Ghali BENCHEKROUN** - [elghali97](https://github.com/elghali97)

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details