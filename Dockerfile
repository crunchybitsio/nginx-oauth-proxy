# Use the base Nginx image from Docker Hub
FROM nginx

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
        git \
        build-essential \
        libssl-dev

# Clone OAuth2 Proxy into the Docker image
RUN git clone https://github.com/oauth2-proxy/oauth2-proxy.git

# Go into the OAuth2 Proxy directory
WORKDIR oauth2-proxy

# Build OAuth2 Proxy
RUN make build

# Copy the OAuth2 Proxy binary to /bin
RUN cp oauth2-proxy /bin

# Copy the Nginx and OAuth2 Proxy configuration files into the Docker image
COPY nginx.conf /etc/nginx/nginx.conf
COPY oauth2_proxy.cfg /etc/oauth2_proxy.cfg
