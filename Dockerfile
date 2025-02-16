# Use a base image with your preferred OS (e.g., Debian or Ubuntu)
FROM debian:bookworm-slim

# Set environment variables to non-interactive mode (prevents prompts)
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install dependencies
RUN apt-get update && apt-get -y install \
    ser2net \
    && apt-get clean

# Copy local config file
COPY ser2net.conf /etc

# Expose the default port for ser2net (adjust based on your configuration)
EXPOSE 20108

# Start ser2net service when the container starts
CMD ["/bin/sh", "-c", "\"/bin/sh\" \"-c\" \"echo -n \\\"Starting \\\" && ser2net -v && ser2net -d -c /etc/ser2net.conf\""]
