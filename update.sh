#!/usr/bin/env bash
set -euo pipefail

repo=kunalgoesbyken/gostman
tag=$(gh release view --repo "$repo" --json tagName --jq .tagName)
version=${tag#v}
sums=$(gh release download "$tag" --repo "$repo" --pattern SHA256SUMS --output -)

sha() {
  local found
  found=$(awk -v name="$1" '$2 == name { print $1 }' <<<"$sums")
  [[ -n $found ]] || { echo "SHA256SUMS of $tag has no line for $1" >&2; exit 1; }
  echo "$found"
}

cat > Casks/gostman.rb <<CASK
cask "gostman" do
  version "$version"
  sha256 "$(sha Gostman-darwin-universal.dmg)"

  url "https://github.com/$repo/releases/download/v#{version}/Gostman-darwin-universal.dmg"
  name "Gostman"
  desc "API client for REST, GraphQL, gRPC and WebSocket. No account"
  homepage "https://github.com/$repo"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Gostman.app"

  # The build is ad-hoc signed and not notarized, so macOS would ask for a
  # right-click > Open on first launch. Clearing the quarantine flag at install
  # time avoids that. This is acceptable in a personal tap; the official
  # homebrew-cask repository would require a notarized build instead.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Gostman.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Gostman",
    "~/Library/Caches/Gostman",
  ]
end
CASK

cat > Formula/gostman-cli.rb <<FORMULA
class GostmanCli < Formula
  desc "Gostman command line: run API collections in CI, mock, capture, and MCP for agents"
  homepage "https://github.com/$repo"
  version "$version"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/$repo/releases/download/v#{version}/gostman-cli-darwin-arm64.tar.gz"
      sha256 "$(sha gostman-cli-darwin-arm64.tar.gz)"
    else
      url "https://github.com/$repo/releases/download/v#{version}/gostman-cli-darwin-amd64.tar.gz"
      sha256 "$(sha gostman-cli-darwin-amd64.tar.gz)"
    end
  end

  on_linux do
    url "https://github.com/$repo/releases/download/v#{version}/gostman-cli-linux-amd64.tar.gz"
    sha256 "$(sha gostman-cli-linux-amd64.tar.gz)"
  end

  def install
    bin.install "gostman"
  end

  test do
    assert_match "gostman", shell_output("#{bin}/gostman help 2>&1")
  end
end
FORMULA

echo "$version"
