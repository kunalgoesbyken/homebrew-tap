class GostmanCli < Formula
  desc "Gostman command line: run API collections in CI, mock, capture, and MCP for agents"
  homepage "https://github.com/kunalgoesbyken/gostman"
  version "1.20.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/gostman-cli-darwin-arm64.tar.gz"
      sha256 "afbbcbfff97e87ab83a0944e1b984c3281b19757baed2caa653a54349e6ee295"
    else
      url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/gostman-cli-darwin-amd64.tar.gz"
      sha256 "9d2b895f18455f7ef94fbb6cfa548ba56134cf8443bb4b70ddbd915c26a0c438"
    end
  end

  on_linux do
    url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/gostman-cli-linux-amd64.tar.gz"
    sha256 "28c7c3f1646af408a7ba3bd5a8afc16493dba3e82bc65a12731de8e7e7fa90bd"
  end

  def install
    bin.install "gostman"
  end

  test do
    assert_match "gostman", shell_output("#{bin}/gostman help 2>&1")
  end
end
