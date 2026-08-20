cask "azahar" do
  version "2126.0"
  sha256 "42550288cbe4cbd85d59351160c89adab2130721ec7117d26fe147731c34bf12"

  url "https://github.com/azahar-emu/azahar/releases/download/#{version}/azahar-macos-universal-#{version}.zip",
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

  depends_on macos: :ventura

  app "azahar-macos-universal-#{version}/Azahar.app"

  zap trash: "~/Library/Application Support/Azahar"

  caveats do
    <<~EOS
      To remove application from quarantine execute the following command
        xattr -r -d com.apple.quarantine #{appdir}/Azahar.app
      Or install cask using --no-quarantine option
    EOS
  end
end
