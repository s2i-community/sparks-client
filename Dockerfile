# Use a lighter version of Node as a parent image
FROM node:18

# Install basic development tools
RUN apt update && apt install -y less man-db sudo

# Ensure default `node` user has access to `sudo`
ARG USERNAME=node
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME

# Set `DEVCONTAINER` environment variable to help with orientation
ENV DEVCONTAINER=true

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Set entrypoint
CMD [ "/bin/sh", "-c \"while sleep 1000; do :; done\"" ]