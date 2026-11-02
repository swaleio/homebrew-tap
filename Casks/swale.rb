cask "swale" do
  arch arm: "arm64", intel: "x64"
  os macos: "osx", linux: "linux"

  version "1.0.1"
  sha256 arm:          "ed29d22959f12ca392a12061ca0decbb532c1f659ba058c5b95e56c1101d3efe",
         intel:        "cffe9ecca2fce348d8502461efa50b774ffa0690748bc14692c8e162ce5aaf5a",
         arm64_linux:  "06d68343c54292d243042c416380748d2eef4bf5598e7a93e7e0e0ef632b2ba9",
         x86_64_linux: "8811e4f564358fa5c97fa64165e6ed2b69115f1900d73482a5b22bf789924377"

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
