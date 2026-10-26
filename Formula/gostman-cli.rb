class GostmanCli < Formula
  desc "Gostman command line: run API collections in CI, mock, capture, and MCP for agents"
  homepage "https://github.com/kunalgoesbyken/gostman"
  version "1.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kunalgoesbyken/gostman/releases/download/v1.8.3/gostman-cli-darwin-arm64.tar.gz"
      sha256 "fd733a47c3c367b4e8355a4807232f615c602cfd0081704f07ce0907f7a78697"
    else
      url "https://github.com/kunalgoesbyken/gostman/releases/download/v1.8.3/gostman-cli-darwin-amd64.tar.gz"
      sha256 "9776630d6fe17591d01cd6cda4ff8b390b2011798ba57fd919692668e1b454f6"
    end
  end

  on_linux do
    url "https://github.com/kunalgoesbyken/gostman/releases/download/v1.8.3/gostman-cli-linux-amd64.tar.gz"
    sha256 "462f5167cb18fcdadb6208fc8eff986320192149d65b17cc87492249a871f56f"
  end

  def install
    bin.install "gostman"
  end

  test do
    assert_match "gostman", shell_output("#{bin}/gostman help 2>&1")
  end
end
