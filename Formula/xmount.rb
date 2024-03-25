class Xmount < Formula
  desc "Convert between multiple input & output disk image types"
  homepage "https://www.sits.lu/xmount"
  url "https://code.sits.lu/foss/xmount/-/archive/1.1.1/xmount-1.1.1.tar.gz"
  sha256 "76e544cd55edc2dae32c42a38a04e11336f4985e1d59cec9dd41e9f9af9b0008"
  license "GPL-3.0-or-later"
  revision 4

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "afflib"
  depends_on "libewf"
  depends_on "openssl@3"
  depends_on cask: "macfuse"

  def install
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["openssl@3"].opt_lib/"pkgconfig"

    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system bin/"xmount", "--version"
  end
end
