class Xmount < Formula
  desc "Convert between multiple input & output disk image types"
  homepage "https://www.sits.lu/xmount"
  url "https://code.sits.lu/foss/xmount/-/archive/1.1.1/xmount-1.1.1.tar.gz"
  sha256 "501e5f0551f03ce30b834da62a30c4bd130d2c8889444a5e592f91b098aaab45"
  license "GPL-3.0-or-later"
  revision 4

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "cppunit" => :build
  depends_on "cmake" => :build
  depends_on "libtool" => :build
  depends_on "readline" => :build
  depends_on "openssl@3"
  depends_on "lz4"
  depends_on "afflib"
  depends_on "libewf"
  depends_on "aff4-cpp-lite"
  #depends_on cask: "macfuse"

  def install
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["openssl@3"].opt_lib/"pkgconfig"
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["snappy"].opt_lib/"pkgconfig"
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["lz4"].opt_lib/"pkgconfig"
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["raptor"].opt_lib/"pkgconfig"
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["afflib"].opt_lib/"pkgconfig"
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["libxml2"].opt_lib/"pkgconfig"
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["libewf"].opt_lib/"pkgconfig"
    ENV.append_path "PKG_CONFIG_PATH", "/usr/local/lib/pkgconfig"

    system "echo", "cmake", *std_cmake_args
    system "make", "install"
  end

  test do
    system bin/"xmount", "--version"
  end
end
