# My First Infrastructure with Terraform

![Packagist](https://img.shields.io/packagist/l/doctrine/orm.svg)

- Simple WebApp developed for teaching purposes @Wavestone.
- This project is meant to be a learning tool when learning Infrastructure as Code and Architecting with AWS @Wavestone 
- The app is a an HTML form used to upload files to an S3 bucket.

## Requirements
To run this project, you'll need to install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).

# Project Structure:

## /app directory:
- A flask web application served with a user-facing wusgi server (no nginx or such to keep things simple for students).
- The app uses a simple jinja2 templating engine packaged in  the Flask Microframework in order to keep the docker image lightweight
- The app is packaged as a dockerfile in order to be instanciated easily in a standardized way (and avoid students having trouble running the app)

To run the app as a docker container, run the following command:

```sh
docker run -p 80:5000  --env BUCKET_NAME=${BUCKET_NAME} ccollot/webapp-formation
```
The BUCKET_NAME variable is passed as en environment variable to target an existing bucket.

## /infrastructure directory
Terraform configuration to deploy the insfrastructure required to run the app, including:

- Network: 1 VPC, 1 subnet, 1 internet gateway, 1 Security Group, 1 route table and route table association
- Compute: 1 EC2 with default EBS storage settings, 1 bash script passed as cloud init to install docker and run the app
- File storage: 1 S3 bucket
- Security/ IAM : 1 IAM Role / Instance Profile 


# Contributions
Contributions are very welcome! If you find a bug or some improvements, feel free to raise an issue and send a PR. 

## Contributors

* **El Ghali BENCHEKROUN** - [elghali97](https://github.com/elghali97)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details