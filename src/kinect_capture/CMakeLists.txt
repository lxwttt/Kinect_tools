# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
find_library(K4A_LIB NAMES k4a PATHS /usr/local/lib)

add_executable(streaming_samples main.c)
target_link_libraries(streaming_samples k4a
    )