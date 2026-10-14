# Documentation: https://docs.brew.sh/Cask-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "razersynapse" do
  version "4"
  sha256 "51f6f67e88698c7852196f2e5840a4e0c0284df17e935f60bb7d6a24728085cd"

  url "https://dl.razerzone.com/drivers/Synapse4/mac/RazerSynapseInstaller.pkg"
  name "RazerSynapse"
  desc "Razer Synapse is a unified configuration software to any of your Razer peripherals."
  homepage "https://www.razer.com/synapse-4-mac"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url ""
    strategy ""
  end

  depends_on :macos

  pkg "RazerSynapseInstaller.pkg"

  uninstall quit:    "com.razer.Test",
            pkgutil: [
              "com.razer.Anything",
              "com.razer.Test",
            ]

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: ""
end
