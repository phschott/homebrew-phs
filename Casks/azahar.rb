cask "azahar" do
  version "2120.2"
  sha256 "74a0cad400ffc9fcb590a82d0660474ac0898e02eac5c3a9b8c08096d3af0b07"

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

  depends_on macos: ">= :big_sur"

  app "azahar-#{version}-macos-universal/Azahar.app"

  def caveats
    <<~EOS
      To remove application from quarantine execute the following command
        xattr -r -d com.apple.quarantine #{appdir}/Azahar.app
      Or install cask using --no-quarantine option
    EOS
  end

  zap trash: "~/Library/Application Support/Azahar"
end
