class GostmanCli < Formula
  desc "Gostman command line: run API collections in CI, mock, capture, and MCP for agents"
  homepage "https://github.com/kunalgoesbyken/gostman"
  version "1.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kunalgoesbyken/gostman/releases/download/v1.7.0/gostman-cli-darwin-arm64.tar.gz"
      sha256 "a19cc63e656ccb316650efb9890ab30f2edfd949cec88ecca15654e72c2bf623"
    else
      url "https://github.com/kunalgoesbyken/gostman/releases/download/v1.7.0/gostman-cli-darwin-amd64.tar.gz"
      sha256 "60b3ff7b60165f845cdb1d5c282edef46ed1bd40a7ed54a8615383f0089ed9a1"
    end
  end

  on_linux do
    url "https://github.com/kunalgoesbyken/gostman/releases/download/v1.7.0/gostman-cli-linux-amd64.tar.gz"
    sha256 "885ced86fd4e08a0ad2fc90d52ddfb80be0760fb4fdd416d1dbc831d6d6b885a"
  end

  def install
    bin.install "gostman"
  end

  test do
    assert_match "gostman", shell_output("#{bin}/gostman help 2>&1")
  end
end
