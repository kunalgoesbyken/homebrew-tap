class GostmanCli < Formula
  desc "Gostman command line: run API collections in CI, mock, capture, and MCP for agents"
  homepage "https://github.com/kunalgoesbyken/gostman"
  version "1.19.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/gostman-cli-darwin-arm64.tar.gz"
      sha256 "21c11fe2b4fb489fcac22d1565a171c877611bfa6eb03b9c895264c16b93ae17"
    else
      url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/gostman-cli-darwin-amd64.tar.gz"
      sha256 "5430929b1d1a851defbbb8f209d001b173e905bd453c5074c1c47154790c34a6"
    end
  end

  on_linux do
    url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/gostman-cli-linux-amd64.tar.gz"
    sha256 "1ec8c530969d80a93b022a6f447dd6059b48168a808b5c7c0e6dd43aafa5a9e7"
  end

  def install
    bin.install "gostman"
  end

  test do
    assert_match "gostman", shell_output("#{bin}/gostman help 2>&1")
  end
end
