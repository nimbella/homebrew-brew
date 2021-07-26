
class Nimbella < Formula
  desc "Everything you need to get started with Nimbella"
  homepage "https://docs.nimbella.com/command-summary"
  url "https://apigcp.nimbella.io/downloads/nim/nim-v1.16.0/nim-v1.16.0.tar.gz"
  sha256 "42f82e02611af5b61a83b14ca5f8dc8bff5285ca9182cf4742e1d188cb8bf905"
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
