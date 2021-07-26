
class Nimbella < Formula
  desc "Everything you need to get started with Nimbella"
  homepage "https://docs.nimbella.com/command-summary"
  url "https://apigcp.nimbella.io/downloads/nim/nim-v1.16.0/nim-v1.16.0.tar.xz"
  sha256 "06ada8b2b2e9a08eec95efbdb4664b1f1a4fb7e4d4eccc4bf621773040ba22d4"
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
