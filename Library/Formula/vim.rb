require 'formula'

# imported from homebrew-dupes

class Vim < Formula
  homepage 'http://www.vim.org/'
  # Get stable versions from hg repo instead of downloading an increasing
  # number of separate patches.
  url 'https://vim.googlecode.com/hg/', :revision => '1d1cce57421c'
  version '7.3.502'
  platforms :linux

  depends_on 'ncurses' if linux

  head 'https://vim.googlecode.com/hg/'

  def install
    args = [
      "--enable-fail-if-missing",
      "--prefix=#{prefix}",
      "--mandir=#{man}",
      "--enable-gui=no",
      "--without-x",
      "--disable-nls",
      "--enable-multibyte",
      "--with-tlib=ncurses",
      "--enable-pythoninterp",
      "--enable-rubyinterp",
      "--enable-perlinterp",
      "--enable-cscope",
      "--with-ruby-command=/usr/bin/ruby",
      "--with-features=huge"
    ]
    if ARGV.include? '--with-lua'
      args.push "--enable-luainterp=yes" #TODO dynamic
      args.push "--with-lua-prefix=#{HOMEBREW_PREFIX}"
    end
    system "./configure", *args
    system "make"
    system "make install"
  end
end
