require 'formula'

class GnuTime < Formula
  url 'http://ftpmirror.gnu.org/time/time-1.7.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/time/time-1.7.tar.gz'
  homepage 'http://www.gnu.org/software/time/'
  md5 'e38d2b8b34b1ca259cf7b053caac32b3'
  platforms :mac, :linux
  def install
    system "./configure", "--program-prefix=g",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--info=#{info}"
    system "make install"
  end
end
