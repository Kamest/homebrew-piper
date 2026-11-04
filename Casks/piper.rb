cask "piper" do
  arch arm: "arm64", intel: "x64"

  version "0.1.10"
  sha256 arm:   "f6a9efac06141c6a0aa898b78929ed82d8d73a8db5ec6a37958d6cb66bc9520c",
         intel: "3105c1d8d47c198b89658face1db2df8abf05950f1a02ca4b4c9a09cfb44d93d"

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
