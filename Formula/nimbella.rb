class Nimbella < Formula
  desc "Everything you need to get started with Nimbella"
  homepage "https://docs.nimbella.com/command-summary"
  url "https://apigcp.nimbella.io/downloads/nim/nim-v1.16.0/nim-v1.16.0.tar.gz"
  sha256 "9ded04e0ebc3b0de2ef53c84ccf9073018c220a5fbabcc68298b83a507b5bd11"
  depends_on "nimbella/brew/nimbella-node" => "14.4.0"

  def install
    inreplace "bin/nim", /^CLIENT_HOME=/, "export NIMBELLA_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/nim", "\"$DIR/node\"", Formula["nimbella-node"].opt_bin/"node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/nim"
  end

  test do
    system bin/"nim", "version"
  end
end
