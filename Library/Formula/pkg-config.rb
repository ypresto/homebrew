require 'formula'

class PkgConfig < Formula
  homepage 'http://pkg-config.freedesktop.org'

  # yes we know pkg-config 0.26 is now out, however it depends on glib
  # this is totally ridiculous dependency and we refuse to upgrade until
  # someone can prove we must.
  url 'http://pkg-config.freedesktop.org/releases/pkg-config-0.25.tar.gz'
  md5 'a3270bab3f4b69b7dc6dbdacbcae9745'

  platforms :mac, :linux

  @_mac = mac

  def install
    # fixes compile error on Lion with Clang duplicate symbols in libglib
    ENV.append_to_cflags '-std=gnu89' if @_mac and ENV.compiler == :clang

    paths = %W[
        #{HOMEBREW_PREFIX}/lib/pkgconfig
        #{HOMEBREW_PREFIX}/share/pkgconfig
        /usr/local/lib/pkgconfig
        /usr/lib/pkgconfig
        /usr/X11/lib/pkgconfig
      ].uniq
    system "./configure", "--disable-debug",
                          "--prefix=#{prefix}",
                          "--with-pc-path=#{paths*':'}"
    system "make"
    system "make check"
    system "make install"
  end
end
