# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class SvtAv1 < Formula
  desc "SVT-AV1 video codec"
  homepage "https://gitlab.com/AOMediaCodec/SVT-AV1"
  url "https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v0.8.7/SVT-AV1-v0.8.7.tar.gz"
  sha256 "de24e4a6c557498b2e8caf9cca438411db5f837d232b9390dc3899d974fec16f"
  head "https://gitlab.com/AOMediaCodec/SVT-AV1"
  license "BSD-2-Clause"

  depends_on "cmake" => :build
  depends_on "make" => :build
  depends_on "yasm" => :build
  
  def install
    Dir.chdir("Build")
    system "cmake", "..", "-G", "Unix Makefiles", "-DCMAKE_BUILD_TYPE=Release", "-DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/SvtAv1EncApp", "--help"
  end
end
