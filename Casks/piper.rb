cask "piper" do
  arch arm: "arm64", intel: "x64"

  version "0.1.18"
  sha256 arm:   "b73a3df263f5f4259cf931289634e856686025ce1c9bab43b71c62a3a7754f5d",
         intel: "87aad54239aa8c5f4fd828b0cc9cedf0bdc857151755a853f281bcacb516f943"

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
