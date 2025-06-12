cask "archi" do
  arch arm: "Silicon-"

  version "5.5.0"
  sha256 arm:   "83914582fef0e07b36e869545c2a55dd542336b59ddf9e6fb71b7a143f380d68",
         x86_64: "05e40f4ec638a600aca04e0ff9d30a13e3f750ffbc5a25136e25857aca64cec9"

  url "https://www.archimatetool.com/downloads/archi/#{version.major_minor}/Archi-Mac-#{arch}#{version}.dmg"
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
