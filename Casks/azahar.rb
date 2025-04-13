cask "azahar" do
    version "2120.2"
    sha256 "74a0cad400ffc9fcb590a82d0660474ac0898e02eac5c3a9b8c08096d3af0b07"
  
    url "https://github.com/azahar-emu/azahar/releases/download/#{version}/azahar-#{version}-macos-universal.zip"
    name "Azahar"
    desc "Nintendo 3DS emulator"
    homepage "https://azahar-emu.org/"
  
    livecheck do
      skip "No version information available"
    end
  
    auto_updates false
  
    app "azahar-#{version}-macos-universal/Azahar.app"

    def caveats
        <<~EOS
          To remove application from quarantine execute the following command
            xattr -r -d com.apple.quarantine #{appdir}/Azahar.app
          Or install cask using --no-quarantine option
        EOS
    end
  
    zap trash: [
      "~/Library/Application Support/Azahar"
    ]
  end
  