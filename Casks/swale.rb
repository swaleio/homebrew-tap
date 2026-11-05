cask "swale" do
  arch arm: "arm64", intel: "x64"
  os macos: "osx", linux: "linux"

  version "1.1.0"
  sha256 arm:          "7e3cdf01fffdd622dd92fc0f9d1ccd59f0f97b0d1628e86c0eed0542252b3d26",
         intel:        "26463a85dcbb1ce5687a55f57a45f228c80de5dd6bcf79e1b31cd3de95c2b1b8",
         arm64_linux:  "31f03b8cd7e68828d26985450638856bb0903b2c850323150bf6f318022cccfb",
         x86_64_linux: "f745bac4afc87bd99f83a9cf37ca0562e0c91da14e1e9082fc5a1b5d94c7b821"

  url "https://github.com/swaleio/swale-cli/releases/download/v#{version}/swale-cli-#{os}-#{arch}"
  name "Swale CLI"
  desc "Push and pull files, manage workflows and start runs on Swale"
  homepage "https://swale.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  container type: :naked

  binary "swale-cli-#{os}-#{arch}", target: "swale"

  zap trash: "~/.swale"
end
