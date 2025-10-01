cask "azahar" do
  version "2122.1"
  sha256 "a9adf930747b65b962003fc0057c2dc95ebe0872a51e29e451785e9a9f34101b"

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

  zap trash: "~/Library/Application Support/Azahar"

  caveats do
    <<~EOS
      To remove application from quarantine execute the following command
        xattr -r -d com.apple.quarantine #{appdir}/Azahar.app
      Or install cask using --no-quarantine option
    EOS
  end
end
