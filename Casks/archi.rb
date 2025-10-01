cask "archi" do
  arch arm: "Silicon-"

  version "5.7.0"
  sha256 arm:   "dbfc38f9a29f8df4c62e38e5fe73a8b85b67bfbfe48e67dece4ae649ae1a6e57",
         intel: "c0896127a5e684be6b31be73c07258c1a982c15d773cae77c22f6e1172206b92"

  url "https://github.com/archimatetool/archi.io/releases/download/#{version}/Archi-Mac-#{arch}#{version}.dmg",
      verified: "github.com/archimatetool/archi.io/"
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
