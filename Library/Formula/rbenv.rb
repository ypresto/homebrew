require 'formula'

class Rbenv < Formula
  homepage 'https://github.com/sstephenson/rbenv'
  url 'https://github.com/sstephenson/rbenv/tarball/v0.3.0'
  md5 '26e00faff3ba04fdeeeecb0bfbf96351'

  head 'https://github.com/sstephenson/rbenv.git'
  platforms :mac, :linux
  def install
    prefix.install Dir['*']
  end

  def caveats; <<-EOS.undent
    To enable shims and autocompletion, add rbenv init to your profile:
      eval "$(rbenv init -)"
    EOS
  end
end
