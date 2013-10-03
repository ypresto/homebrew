require 'formula'

class Hub < Formula
  url 'https://github.com/defunkt/hub/tarball/v1.10.2'
  homepage 'http://defunkt.io/hub/'
  head 'https://github.com/defunkt/hub.git'
  md5 'aa7a92bb5ea3aeb47bef5e280db6fb87'
  platforms :mac, :linux

  @_mac = mac

  def install
    system rake_bin, "install", "prefix=#{prefix}"
    (prefix+'etc/bash_completion.d').install 'etc/hub.bash_completion.sh'
    (share+'zsh/site-functions').install 'etc/hub.zsh_completion' => '_hub'
  end

  def rake_bin
    require 'rbconfig'
    ruby_rake = File.join RbConfig::CONFIG['bindir'], 'rake'

    if File.exist? ruby_rake
      ruby_rake
    elsif @_mac
      '/usr/bin/rake'
    else
      'rake'
    end
  end

  def caveats; <<-EOS.undent
    Bash completion has been installed to:
      #{etc}/bash_completion.d

    zsh completion has been installed to:
      #{HOMEBREW_PREFIX}/share/zsh/site-functions
    EOS
  end
end
