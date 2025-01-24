# this dockerfile is used to create microsoft self hosted containerized linux agents to be used in Azure DevOps
FROM ubuntu:22.04
# build arguments
ARG AZP_URL
ARG AZP_TOKEN
ARG AZP_POOL
ARG AZP_AGENT_NAME

# Set environment variables from build arguments
ENV AZP_URL=${AZP_URL}
ENV AZP_TOKEN=${AZP_TOKEN}
ENV AZP_POOL=${AZP_POOL}
ENV AZP_AGENT_NAME=${AZP_AGENT_NAME}
ENV TARGETARCH="linux-x64"
# Also can be "linux-arm", "linux-arm64".

# Update and install required dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
        curl \
        git \
        jq \
        libicu70 \
        wget \
        software-properties-common && \
    apt-get clean

# Install Helm
RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install kubectl (needed for KEDA management)
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Optional: Install Python and pip for additional dependencies
RUN apt-get install -y python3 python3-pip

WORKDIR /azp/

COPY ./start.sh ./
RUN chmod +x ./start.sh

# Create agent user and set up home directory
RUN useradd -m -d /home/agent agent
RUN chown -R agent:agent /azp /home/agent

USER agent
# Another option is to run the agent as root.
# ENV AGENT_ALLOW_RUNASROOT="true"

ENTRYPOINT [ "./start.sh" ]