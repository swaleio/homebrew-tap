cask "swale" do
  arch arm: "arm64", intel: "x64"
  os macos: "osx", linux: "linux"

  version "1.3.0"
  sha256 arm:          "d72ddd0553247b4c1819c14dd8cddf3f6a2d74d41e5d9888eccac8d34490cf20",
         intel:        "6fe0640553595a774d8b93386b7a4d975300f69ef1ac08588e120a93402d1e4f",
         arm64_linux:  "0976765a4ddec96f7f241bbc05f9b0c1c9b45b58f46d0c56cbf664582b131f43",
         x86_64_linux: "51799596f32af9c58a3a981651d1a7a5621ea3ebc46d31e0ada708824c9f3b45"

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
