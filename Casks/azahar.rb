cask "azahar" do
  version "2123.2"
  sha256 "aa097bd462bc79e88d233dd563a02eb48e866179138b87ec4986acead8dfbb9d"

  url "https://github.com/azahar-emu/azahar/releases/download/#{version}/azahar-#{version}-macos-universal.zip",
      verified: "github.com/azahar-emu/"
  name "Azahar"
  desc "Nintendo 3DS emulator"
  homepage "https://azahar-emu.org/"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url "https://github.com/azahar-emu/azahar/releases"
    strategy :page_match
    regex(%r{href=.*?tag/?(\d+(?:\.\d+)*)}i)
  end

  depends_on macos: ">= :ventura"

  app "azahar-#{version}-macos-universal/Azahar.app"

  zap trash: "~/Library/Application Support/Azahar"

  caveats do
    <<~EOS
      To remove application from quarantine execute the following command
        xattr -r -d com.apple.quarantine #{appdir}/Azahar.app
      Or install cask using --no-quarantine option
    EOS
  end
end
