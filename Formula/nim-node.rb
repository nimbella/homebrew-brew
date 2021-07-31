require "language/node"

class NimNode < Formula
  desc "node.js dependency for nimbella"
  homepage "https://docs.nimbella.com/command-summary"
  license "Apache-2.0"
  url "https://nodejs.org/download/release/v14.4.0/node-v14.4.0-darwin-x64.tar.xz"
  version "14.4.0"
  sha256 "98af3b9c9a179fbf731c06a9acedeb00c7fff8c8cb18cb48fa6f6cccd0013cd2"
  keg_only "nim-node is only used by Nimbella CLI (nimbella/brew/nimbella), which explicitly requires from Cellar"

  resource "node" do
    url https://nodejs.org/download/release/v14.4.0/node-v14.4.0-darwin-x64.tar.xz
    sha256 98af3b9c9a179fbf731c06a9acedeb00c7fff8c8cb18cb48fa6f6cccd0013cd2
  end

  def install
    # bin.install buildpath/"bin/node"
    buildpath.install resource("node")
  end
  
  def test
    output = system bin/"node", "version"
    assert output.strip == "v#{version}"
  end
end
