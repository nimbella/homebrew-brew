require "language/node"

class NimbellaCli < Formula
  desc "Everything you need to get started with Nimbella"
  homepage "https://docs.nimbella.com"
  url "https://apigcp.nimbella.io/downloads/nim/nim-v1.13.0/nim-v1.13.0-linux-x64.tar.gz"
  version "1.13.0"
  sha256 "5b27dcb47f8ccce76b3f4afe87f250d26ca23b7db80ce4ac779f9e855d17e7a5"
  license "Apache-2.0"
  depends_on "node"

  def install
    inreplace "bin/nim", /^CLIENT_HOME=/, "export NIMBELLA-CLI_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/nim"
  end

  test do
    system bin/"nim", "version"
  end

end
