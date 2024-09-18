cask "archi" do
  arch arm: "Silicon-"

  version "5.4.1"
  sha256 arm:   "55ad9973fda328be895a949c480d4c440f2bc594104f8521212074ab074638d6",
         intel: "f17b630cd0eb06bbbd181f869f280639ac3d3fdc8779a9961ef27e87fbf0e087"

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
