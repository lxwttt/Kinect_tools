# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
project(kinect_capture)

set(catkin_DIR "/opt/ros/noedic/include/")
set(CMAKE_PREFIX_PATH _PATH "/opt/ros/noetic;${CMAKE_MODULE_PATH}")

catkin_package(CATKIN_DEPENDS roscpp rospy std_msgs)

find_package(catkin REQUIRED roscpp rospy std_msgs )

# set(k4a_DIR "/home/rm/kinect_tools/src/Azure_Kinect_ROS_Driver/ext/sdk")

# find_library(K4A_LIB NAMES k4a PATHS k4a_DIR)

include_directories(
  ${catkin_INCLUDE_DIRS}
  # "/home/rm/kinect_tools/src/Azure_Kinect_ROS_Driver/ext/sdk/include"
)

add_executable(capturing main.cpp)
target_link_libraries(capturing ${catkin_LIBRARIES}
    )