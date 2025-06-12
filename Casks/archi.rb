cask "archi" do
  arch arm: "Silicon-"

  version "5.6.0"
  sha256 arm:   "6bcd10c894fe9a2cd3e1bc6127fd6b5e74066ead19c709aa6fbe27d901f81f72",
         intel: "35958c4332ec3dc27b719a18154c57c4b22eef20881c4e69c3df94aa3b46ec27"

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
