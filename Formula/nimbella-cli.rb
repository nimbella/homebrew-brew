require "language/node"

class NimbellaCli < Formula
  desc "Everything you need to get started with Nimbella"
  homepage "https://docs.nimbella.com/command-summary"
  url "https://apigcp.nimbella.io/downloads/nim/nim-v1.16.0/nim-v1.16.0.tar.gz"
  sha256 "9ded04e0ebc3b0de2ef53c84ccf9073018c220a5fbabcc68298b83a507b5bd11"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.local_npm_install_args
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"nim", "version"
  end
end
