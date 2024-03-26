class Aff4CppLite < Formula
  desc "Advanced Forensic Format"
  homepage "https://github.com/aff4/aff4-cpp-lite"
  url "https://github.com/aff4/aff4-cpp-lite.git"
  license "LGPL-3.0-or-later"
  revision 1

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "snappy"
  depends_on "raptor"
  depends_on "libxml2"
  depends_on "pkg-config"

  def install
    system "./autogen.sh"
    system "./configure", *std_configure_args
    system "make", "install"
  end
end