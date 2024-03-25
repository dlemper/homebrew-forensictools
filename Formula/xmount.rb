class Xmount < Formula
  desc "Convert between multiple input & output disk image types"
  homepage "https://www.sits.lu/xmount"
  url "https://code.sits.lu/foss/xmount/-/archive/1.1.1/xmount-1.1.1.tar.gz"
  sha256 "501e5f0551f03ce30b834da62a30c4bd130d2c8889444a5e592f91b098aaab45"
  license "GPL-3.0-or-later"
  revision 4

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl@3"
  depends_on "cppunit"
  depends_on "autoconf"
  depends_on "automake"
  depends_on "cmake"
  depends_on "libtool"
  depends_on "readline"
  #depends_on cask: "macfuse"

  def install
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["openssl@3"].opt_lib/"pkgconfig"

    system "grep -v 'read -p' BuildLibs.sh > BuildLibsNoWait.sh"
    system "chmod a+x BuildLibsNoWait.sh"
    system "./BuildLibsNoWait.sh osx"
    system "cmake", "-DCMAKE_BUILD_TYPE=Releas", "-DSTATIC=1", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system bin/"xmount", "--version"
  end
end
