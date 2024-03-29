# This file is automatically generated by https://github.com/nimbella/nimbella-cli/blob/master/release/homebrew.js
# Do not update this file directly;
# Please update the template instead:
# https://github.com/nimbella/nimbella-cli/blob/master/release/homebrew/templates/nimbella.rb
class Nimbella < Formula
    desc "Everything you need to get started with Nimbella"
    homepage "https://docs.nimbella.com/command-summary"
    license "Apache-2.0"
    url "https://apigcp.nimbella.io/downloads/nim/nim-v1.17.0/nim-v1.17.0.tar.gz"
    sha256 "101ded3c549651161c4c15e08527345b71555b05084f5f5060abacd977146514"
    depends_on "nimbella/brew/nimbella-node" => "14.4.0"
  
    def install
      inreplace "bin/nim", "\"$DIR/node\"", Formula["nimbella-node"].opt_bin/"node"
      libexec.install Dir["*"]
      bin.install_symlink libexec/"bin/nim"
    end
  
    test do
      system bin/"nim", "version"
    end
end
