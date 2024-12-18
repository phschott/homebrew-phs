cask "archi" do
  arch arm: "Silicon-"

  version "5.4.3"
  sha256 arm:   "59ddce5cc5ae7ecd37472854924be830a1b6c08d6ae343166934e4af38a8e08b",
         intel: "63def0330cdad2347a7315aa9d4223401becb4bb73efc421440f387902aa9387"

  url "https://www.archimatetool.com/downloads/archi/#{version}/Archi-Mac-#{arch}#{version}.dmg"
  name "Archimate modeling"
  desc "Toolkit for the ArchiMate modelling language"
  homepage "https://www.archimatetool.com/"

  livecheck do
    url "https://www.archimatetool.com/download"
    strategy :page_match
    regex(%r{href=.*?/Archi-Mac[._-]?(\d+(?:\.\d+)*)\.dmg}i)
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Archi.app"

  def caveats
    <<~EOS
      To remove application from quarantine execute the following command
        xattr -r -d com.apple.quarantine #{appdir}/Archi.app
      Or install cask using --no-quarantine option
    EOS
  end

  zap trash: "~/Library/Application Support/Archi"
end
