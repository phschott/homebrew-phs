cask "azahar" do
  version "2122"
  sha256 "5fd63db65e915e5cdfbc00e8f0c8420907d629652bc0e3cc7f096c6d64d1b3d0"

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
