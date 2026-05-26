cask "hanzo-desktop" do
  version "1.1.28.22"
  arch arm: "aarch64-apple-darwin", intel: "x86_64-apple-darwin"

  on_arm do
    sha256 "cd97b15de968a42142b694ac31a5f933fcb27d4d62367d632498228a77602438"
  end

  url "https://github.com/hanzoai/desktop/releases/download/1.1.28/Hanzo-Desktop-#{version}_#{arch}.dmg",
      verified: "github.com/hanzoai/desktop/"
  name "Hanzo Desktop"
  desc "Hanzo AI desktop app — local agents, workflows, and model orchestration"
  homepage "https://github.com/hanzoai/desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Hanzo.app"

  zap trash: [
    "~/Library/Application Support/ai.hanzo.desktop",
    "~/Library/Caches/ai.hanzo.desktop",
    "~/Library/Logs/ai.hanzo.desktop",
    "~/Library/Preferences/ai.hanzo.desktop.plist",
    "~/Library/Saved Application State/ai.hanzo.desktop.savedState",
  ]
end
