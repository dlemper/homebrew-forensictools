class CAff4 < Formula
  desc "Advanced Forensic Format"
  homepage "https://github.com/dlemper/c-aff4"
  url "https://github.com/dlemper/c-aff4.git"
  license "Apache"
  revision 1

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "snappy"
  depends_on "lz4"
  depends_on "raptor"
  depends_on "tclap"
  depends_on "uriparser"
  depends_on "spdlog"
  depends_on "yaml-cpp"
  depends_on "pkg-config"

  def install
    system "./autogen.sh"
    system "./configure", *std_configure_args
    system "make", "install"
  end

  test do
    system "#{bin}/aff4imager", "--version"
  end
end