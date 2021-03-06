require 'formula'

class Libftdi < Formula
  homepage 'http://www.intra2net.com/en/developer/libftdi'
  url 'http://www.intra2net.com/en/developer/libftdi/download/libftdi1-1.0.tar.bz2'
  sha1 '5be76cfd7cd36c5291054638f7caf4137303386f'

  depends_on 'cmake' => :build
  depends_on 'libusb'

  def install
    mkdir 'libftdi-build' do
      libusb_include = Formula.factory('libusb').include
      system "cmake", "..", "-DLIBUSB_INCLUDE_DIR=#{libusb_include}/libusb-1.0", *std_cmake_args
      system "make install"
    end
  end
end
