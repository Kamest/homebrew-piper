cask "piper" do
  arch arm: "arm64", intel: "x64"

  version "0.1.15"
  sha256 arm:   "a12e6c8f4d82e3b4ce91d371548b45eea65e0121a6d377c5ed99c540ce4dea78",
         intel: "23475723503ae099e61df850000ceafcef6e6fae3216136c9b55a87be77abe61"

  url "https://github.com/Kamest/Piper/releases/download/desktop-v#{version}/Piper-#{version}-mac-#{arch}.dmg"
  name "Piper"
  desc "Desktop window and tray for the independent Piper service"
  homepage "https://kamest.github.io/Piper/"

  livecheck do
    url "https://github.com/Kamest/Piper/releases"
    regex(/^desktop-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on macos: :ventura

  app "Piper.app"

  zap trash: [
    "~/Library/Application Support/piper-desktop",
    "~/Library/Logs/piper-desktop",
  ]

  caveats <<~EOS
    This build is not signed with an Apple Developer ID or notarized yet.
    After the first launch attempt, open System Settings > Privacy & Security > Open Anyway.
    Docker is your own prerequisite; install and start it before setting up Piper.
  EOS
end
