#include <iostream>
#include <torch/torch.h>
#include <torchvision/io/image/image.h>

int main(int argc, char const *argv[]) {

  torch::Tensor tensor = vision::image::read_file("./map.jpeg");
  vision::image::write_file("map2.jpeg", tensor);

  std::cout << tensor << std::endl;

  return 0;
}
