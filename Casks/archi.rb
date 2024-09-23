cask "archi" do
  arch arm: "Silicon-"

  version "5.4.2"
  sha256 arm:   "d0a678e3838e26ddf97e4781469a3618f2b168a1af0e467f49c0cdaf010b9077",
         intel: "eb170c89b2a7dbc06af7dd6c7f400a8846cd77ab79b2ed3b3995d7147fe54469"

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
