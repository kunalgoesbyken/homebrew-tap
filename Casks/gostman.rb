cask "gostman" do
  version "1.19.1"
  sha256 "fcfdbbf469b067e3c83e69bc418d5d8d322ac731748b8b6ce086afd2f4e34c79"

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
