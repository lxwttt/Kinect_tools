# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
project(kinect_capture)

set(catkin_DIR "/opt/ros/melodic/include/")
set(CMAKE_PREFIX_PATH _PATH "/opt/ros/melodic;${CMAKE_MODULE_PATH}")

find_package(catkin REQUIRED roscpp rospy std_msgs)

catkin_package(CATKIN_DEPENDS roscpp rospy std_msgs)

find_library(K4A_LIB NAMES k4a PATHS /usr/local/lib)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_executable(capturing main.cpp)
target_link_libraries(capturing k4a ${catkin_LIBRARIES}
    )