class GostmanCli < Formula
  desc "Gostman command line: run API collections in CI, mock, capture, and MCP for agents"
  homepage "https://github.com/kunalgoesbyken/gostman"
  version "1.17.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/gostman-cli-darwin-arm64.tar.gz"
      sha256 "5aca928a2be0067883775c42f20f72f562fe1213ed4b2c45db7e528f278892a8"
    else
      url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/gostman-cli-darwin-amd64.tar.gz"
      sha256 "62c65434e9bf1b1ac63b0c45205249cf1bf47f76fd8dc7f5499eb1faedfaac87"
    end
  end

  on_linux do
    url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/gostman-cli-linux-amd64.tar.gz"
    sha256 "376defcc7a14689b883cf3f9aded08901a39ff0271ffcf1e5fc16124fc11a532"
  end

  def install
    bin.install "gostman"
  end

  test do
    assert_match "gostman", shell_output("#{bin}/gostman help 2>&1")
  end
end
