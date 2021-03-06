require 'formula'

class GitFlowCompletion < Formula
  homepage 'https://github.com/bobthecow/git-flow-completion'
  url 'https://github.com/bobthecow/git-flow-completion/tarball/0.4.1.0'
  md5 '95c05d1a278c1c41067bd7cc6c281ecd'

  head 'https://github.com/bobthecow/git-flow-completion.git', :branch => 'develop'
end

class GitFlow < Formula
  homepage 'https://github.com/nvie/gitflow'

  # Use the tag instead of the tarball to get the submodule
  url 'https://github.com/nvie/gitflow.git', :tag => '0.4.1'
  version '0.4.1'

  head 'https://github.com/nvie/gitflow.git', :branch => 'develop'
  platforms :mac, :linux
  def install
    system "make", "prefix=#{prefix}", "install"

    GitFlowCompletion.new.brew do
      (prefix+'etc/bash_completion.d').install "git-flow-completion.bash"
      (share+'zsh/functions').install "git-flow-completion.zsh"
    end
  end
end
