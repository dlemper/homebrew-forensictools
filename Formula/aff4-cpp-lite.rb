class Aff4CppLite < Formula
  desc "Advanced Forensic Format"
  homepage "https://github.com/aff4/aff4-cpp-lite"
  url "https://github.com/aff4/aff4-cpp-lite/archive/refs/tags/v2.1.1-pre.tar.gz"
  license "LGPL-3.0-or-later"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "cppunit" => :build
  depends_on "openssl@3"
  depends_on "snappy"
  depends_on "raptor"
  depends_on "libxml2"
  depends_on "lz4"
  depends_on "pkg-config"

  def install
    #ENV.append_to_cflags
    ENV["CFLAGS"] = "-fPIC -DO_LARGEFILE=0x0 -Dpread64=pread"
    ENV["CXXFLAGS"] = "-fPIC -DO_LARGEFILE=0x0 -Dpread64=pread -std=c++11"

    system "sed", "-i.bak", "s#/opt/local#/opt/homebrew#", "autogen.sh"
    system "./autogen.sh"
    system "./configure", "--prefix="+self.prefix
    system "make", "install"
  end
end