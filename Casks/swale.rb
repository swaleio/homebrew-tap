cask "swale" do
  arch arm: "arm64", intel: "x64"
  os macos: "osx", linux: "linux"

  version "1.2.0"
  sha256 arm:          "7027351907c7726c1a9e395177a1fb6fa986ada51cf626bc281ebd1e7b08522a",
         intel:        "c9e389c6ea60824d5f71434e711def20e2e84ec18c602581bdcfa07130bc27cf",
         arm64_linux:  "5931f8f7e0337f942713ca25761f5bdc9560c49aeb0e3a5c3ea2a0185a323a3d",
         x86_64_linux: "36c6455d268ad51d44d0dfab1d9f22433eeb8bdc781e7e0d28a9b3d8b4215462"

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
