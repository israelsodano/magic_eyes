cmake_minimum_required(VERSION 3.27)
project(magic_eyes)

list(APPEND CMAKE_PREFIX_PATH 
    "./libtorch"
    "./torchvision"
    "${CMAKE_BINARY_DIR}")

file(GLOB SOURCE_FILES
    "src/*.cpp")

add_executable(${PROJECT_NAME} ${SOURCE_FILES})
find_package(Torch 2.1.1 REQUIRED)
find_package(TorchVision REQUIRED)

include_directories(
    ${TORCH_INCLUDE_DIRS}
    ${TorchVision_INCLUDE_DIR})

target_link_libraries(${PROJECT_NAME}
    ${TORCH_LIBRARIES}
    TorchVision::TorchVision)


