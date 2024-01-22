if [ ! -d "./libtorch" ]; then
    if [ ! -f "./libtorch.zip" ]; then
        wget https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-2.1.1%2Bcpu.zip
        mv libtorch-cxx11-abi-shared-with-deps-2.1.1+cpu.zip libtorch.zip
        unzip ./libtorch.zip -d .
        rm ./libtorch.zip
    fi
fi
if [ ! -d "./torchvision" ]; then
    if [ ! -d "./vision" ]; then
        git clone https://github.com/pytorch/vision.git
    fi
    if [ ! -d "./vision/build" ]; then
        mkdir ./vision/build
    fi

    cd ./vision/build && \
    cmake -DTorch_DIR="$(echo "$(cd "../../libtorch/share/cmake/Torch" && pwd)")" -DCMAKE_BUILD_TYPE=Debug .. && \
    cmake --build . && \
    cmake --install . --prefix=../../torchvision
    rm -rf ../../vision
fi