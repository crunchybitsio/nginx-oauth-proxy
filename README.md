Sure, here's a draft for a README file that describes your project:

---

# Nginx with OAuth2 Proxy and Azure AD Integration

This project provides a Docker image that extends the base Nginx image with support for OAuth2 Proxy and Azure Active Directory (AD) integration. The Docker image is built using a Dockerfile and is automatically pushed to the GitHub Container Registry using a GitHub Actions workflow.

## Overview

The Dockerfile in this repository is used to create a Docker image that extends the base Nginx image. The Nginx server is configured to act as a reverse proxy that forwards incoming HTTP requests to OAuth2 Proxy.

OAuth2 Proxy is configured to use Azure AD as the authentication provider. This means that before a user can access the Nginx server, they must first authenticate with Azure AD.

The GitHub Actions workflow in this repository is triggered on every push to the main branch. It builds the Docker image using the Dockerfile and then pushes the image to the GitHub Container Registry.

## Usage

To use the Docker image, you'll first need to pull it from the GitHub Container Registry. You can do this with the following command:

```bash
docker pull ghcr.io/<your-github-username>/nginx-oauth2-proxy:latest
```

Replace `<your-github-username>` with your actual GitHub username.

Once you've pulled the image, you can run a container from it with the following command:

```bash
docker run -d -p 80:80 ghcr.io/<your-github-username>/nginx-oauth2-proxy:latest
```

This will start a new container in the background and map port 80 in the container to port 80 on your host machine.

## Configuration

The Nginx and OAuth2 Proxy configurations are defined in the `nginx.conf` and `oauth2_proxy.cfg` files, respectively. You'll need to update these files with your actual values before building the Docker image.

The Azure AD integration is configured in the `oauth2_proxy.cfg` file. You'll need to replace the placeholders in this file with your actual Azure AD application ID, client secret, and tenant ID.

## Contributing

Contributions to this project are welcome. Please feel free to open an issue or submit a pull request.

---

This README provides a high-level overview of the project, explains how to use the Docker image, and describes how to configure the Nginx server and OAuth2 Proxy. You might need to adjust it based on your specific use case and environment.
