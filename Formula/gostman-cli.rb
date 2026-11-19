class GostmanCli < Formula
  desc "Gostman command line: run API collections in CI, mock, capture, and MCP for agents"
  homepage "https://github.com/kunalgoesbyken/gostman"
  version "1.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/gostman-cli-darwin-arm64.tar.gz"
      sha256 "ce1f5790196975478eada0a9eec240ac22861210a411336ffef607527147eacb"
    else
      url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/gostman-cli-darwin-amd64.tar.gz"
      sha256 "0334db80d696a8d955630b6321682d891a72c71654450497ca87832d676e3d9b"
    end
  end

  on_linux do
    url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/gostman-cli-linux-amd64.tar.gz"
    sha256 "ecb45fee80dfec71dac6527e7da5602c016eb511cb5d0cd3afaceb5d15c6da43"
  end

  def install
    bin.install "gostman"
  end

  test do
    assert_match "gostman", shell_output("#{bin}/gostman help 2>&1")
  end
end
