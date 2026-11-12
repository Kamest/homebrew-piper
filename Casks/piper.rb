cask "piper" do
  arch arm: "arm64", intel: "x64"

  version "0.1.20"
  sha256 arm:   "f8ebefcfe6b73f608a284a649470ac0173e0f9312aabf02ca2a31f6dda2a6c03",
         intel: "1097d8d3912ba0bdf01fb4f15c34f3c103ae76be1b21eeeb3b53ca4eaaf512b1"

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
