export PICO_SDK_PATH="../pico-sdk"

mkdir -p build
cd ./build
cmake -B./. -S../.

make