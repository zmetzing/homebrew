require 'formula'

class Lcdproc < Formula
  homepage 'http://www.lcdproc.org/'
  url 'http://downloads.sourceforge.net/project/lcdproc/lcdproc/0.5.6/lcdproc-0.5.6.tar.gz'
  sha1 '1d0a4d068141f3c8526cadea035b58b37697600c'

  depends_on 'libusb'
  depends_on 'libftdi'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-drivers=all",
                          "--enable-libftdi=yes"
    system "make"
    system "make install"
  end
end
