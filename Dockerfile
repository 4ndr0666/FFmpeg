# Use the latest Ubuntu as a base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /home/4ndr0/

# Set DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary dependencies
RUN apt-get update && \
    apt-get install -y wget git libgtk2.0-0 libass-dev libvorbis-dev libx264-dev libx265-dev libfdk-aac-dev libvpx-dev libopus-dev

# Install VNC server and other required packages for GUI support
RUN apt-get install -y x11vnc xvfb xterm

# Install CUDA library and set up environment variables
RUN apt-get install -y nvidia-cuda-dev && \
    echo 'export LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}' >> ~/.bashrc && \
    echo 'export PATH=/usr/local/nvidia/bin:${PATH}' >> ~/.bashrc && \
    . ~/.bashrc

# Clone the FFmpeg repository
RUN git clone https://github.com/4ndr0666/FFmpeg.git

# Copy the necessary files and directories into the Docker image
COPY FFmpeg/TopazVideoAIBeta_3.2.4.0.b_amd64.deb /tmp/TopazVideoAIBeta_3.2.4.0.b_amd64.deb
COPY FFmpeg/bin/ /opt/TopazVideoAIBETA/bin/
COPY FFmpeg/include/ /opt/TopazVideoAIBETA/include/
COPY FFmpeg/lib/ /opt/TopazVideoAIBETA/lib/
COPY FFmpeg/models/ /opt/TopazVideoAIBETA/models/

# Install the .deb package and its dependencies
RUN apt-get install -y ./tmp/TopazVideoAIBeta_3.2.4.0.b_amd64.deb && \
    rm /tmp/TopazVideoAIBeta_3.2.4.0.b_amd64.deb

# Set the environment variables for the Topaz Labs dependencies
ENV TOPAZLABS_INCLUDE="/opt/TopazVideoAIBETA/include"
ENV TOPAZLABS_LIB="/opt/TopazVideoAIBETA/lib"

# Set the LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH="/opt/TopazVideoAIBETA/lib:${LD_LIBRARY_PATH}"

# Copy the necessary shared libraries into the Docker image
RUN found=$(find /usr/lib/ -name libavdevice.so.60) && \
    if [ -n "$found" ]; then cp "$found" /opt/TopazVideoAIBETA/lib/; fi && \
    cp /usr/lib/x86_64-linux-gnu/libgtk-x11-2.0.so.0* /opt/TopazVideoAIBETA/lib/

# Set up VNC server
RUN mkdir ~/.vnc && \
    x11vnc -storepasswd 1234 ~/.vnc/passwd

# Copy the entrypoint script
COPY FFmpeg/entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the correct entry point
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
