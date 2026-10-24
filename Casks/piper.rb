cask "piper" do
  arch arm: "arm64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "63e04043a34617b2b821013fdeaf3cb9daa1864bd5600473f49422185c79e81f",
         intel: "ed280a8eadc6104cf80278f3bc9bf89301e8bbf7b8632e6cec83b6d5b863620c"

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
