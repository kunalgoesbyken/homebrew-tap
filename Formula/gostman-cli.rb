class GostmanCli < Formula
  desc "Gostman command line: run API collections in CI, mock, capture, and MCP for agents"
  homepage "https://github.com/kunalgoesbyken/gostman"
  version "1.16.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/gostman-cli-darwin-arm64.tar.gz"
      sha256 "8980f8dae21b85c2211adf5735f33ccc0edaf954094e3658a62736acc93f6ceb"
    else
      url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/gostman-cli-darwin-amd64.tar.gz"
      sha256 "2a5b313dfbdca3b5817c935f0dee1d46aa0643328fca3024f8307b2e4e37693c"
    end
  end

  on_linux do
    url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/gostman-cli-linux-amd64.tar.gz"
    sha256 "13ce5c19a8ad3b13a14ca52f3505d7fb687840d19bd65eff72ccf682865f320e"
  end

  def install
    bin.install "gostman"
  end

  test do
    assert_match "gostman", shell_output("#{bin}/gostman help 2>&1")
  end
end
