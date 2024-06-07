cmake_minimum_required(VERSION 3.10)
project(3D_Cube_Visualizer)

set(CMAKE_CXX_STANDARD 11)

# Include directories
include_directories(${CMAKE_SOURCE_DIR}/src/glad/include)
include_directories(${CMAKE_SOURCE_DIR}/src/stb)
include_directories(${CMAKE_SOURCE_DIR}/src)

# Set GLM path
set(GLM_INCLUDE_DIR /Users/imran/Desktop/glm)
include_directories(${GLM_INCLUDE_DIR})

# Find and include GLFW3
find_package(PkgConfig REQUIRED)
pkg_search_module(GLFW3 REQUIRED glfw3)
include_directories(${GLFW3_INCLUDE_DIRS})
link_directories(${GLFW3_LIBRARY_DIRS})

# Find and include Assimp
find_package(assimp REQUIRED)
include_directories(${ASSIMP_INCLUDE_DIRS})

# Add executable
add_executable(3D_Cube_Visualizer 
    src/main.cpp 
    src/shader.cpp 
    src/camera.cpp 
    src/glad/glad.c 
    src/model.cpp)

# Link libraries
if(APPLE)
    target_link_libraries(3D_Cube_Visualizer 
        ${GLFW3_LIBRARIES}
        ${ASSIMP_LIBRARIES}
        ${CMAKE_DL_LIBS}
        "-framework OpenGL"
        "-framework Cocoa"
        "-framework IOKit"
        "-framework CoreVideo")
else()
    target_link_libraries(3D_Cube_Visualizer 
        ${GLFW3_LIBRARIES}
        ${ASSIMP_LIBRARIES}
        ${CMAKE_DL_LIBS}
        GL
        GLU)
endif()
