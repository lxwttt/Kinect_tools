FROM ros:melodic

# Install the Azure Kinect Sensor SDK
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://packages.microsoft.com/repos/ms-teams/pool/main/m/microsoft-teams/microsoft-teams_1.4.00.7556_amd64.deb && \
    apt install -y ./microsoft-teams_1.4.00.7556_amd64.deb && \
    rm microsoft-teams_1.4.00.7556_amd64.deb && \
    wget https://packages.microsoft.com/repos/azure-cli/pool/main/a/azure-cli/azure-cli_2.28.0-1~buster_all.deb && \
    apt install -y ./azure-cli_2.28.0-1~buster_all.deb && \
    rm azure-cli_2.28.0-1~buster_all.deb && \
    wget https://packages.microsoft.com/repos/azure-cli/pool/main/a/azure-cli-extension-aks-preview/azure-cli-extension-aks-preview_0.6.0-1~buster_all.deb && \
    apt install -y ./azure-cli-extension-aks-preview_0.6.0-1~buster_all.deb && \
    rm azure-cli-extension-aks-preview_0.6.0-1~buster_all.deb && \
    wget https://packages.microsoft.com/repos/azure-cli/pool/main/a/azure-cli-extension-iot-ext/azure-cli-extension-iot-ext_0.13.0-1~buster_all.deb && \
    apt install -y ./azure-cli-extension-iot-ext_0.13.0-1~buster_all.deb && \
    rm azure-cli-extension-iot-ext_0.13.0-1~buster_all.deb && \
    apt-get install -y apt-transport-https && \
    curl -sSL https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/azure-cli.list && \
    apt-get update && \
    apt-get install -y libk4a1.4-dev \
    python-catkin-tools \
    python-rosdep \
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool \
    ros-melodic-catkin \
    ros-melodic-roslint \
    ros-melodic-rosmsg \
    ros-melodic-rosnode \
    ros-melodic-rosout \
    ros-melodic-rosservice \
    ros-melodic-rostopic \
    && rm -rf /var/lib/apt/lists/*

# Copy your code into the container
COPY . /kinect_cap/src

# Build your code
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && \
                  cd /kinect_cap && \
                  catkin_make"

# Set up the entry point
CMD ["/bin/bash", "-c", "source /opt/ros/melodic/setup.bash && \
                          source /catkin_ws/devel/setup.bash && \
                          rosrun kinect_capture my_launch_file.launch"]