cask "gostman" do
  version "1.21.0"
  sha256 "22a3d1dceda88afdd60ac7942617322664e7e1b8b974e4ae3ff4c1f244b45302"

  url "https://github.com/kunalgoesbyken/gostman/releases/download/v#{version}/Gostman-darwin-universal.dmg"
  name "Gostman"
  desc "API client for REST, GraphQL, gRPC and WebSocket. No account"
  homepage "https://github.com/kunalgoesbyken/gostman"

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
