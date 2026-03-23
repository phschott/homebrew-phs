cask "archi" do
  arch arm: "-Silicon"

  version "5.8.0"
  sha256 arm:   "0add079afc3aae592cfff44bd9af0e9bffd0dcddad783a68c58721e0878015bc",
         intel: "ab6a18c6d4b5d39ee368d307e1e15bf8db485a6ea68e54b69c2ffeffc2a2d7f1"

  url "https://github.com/archimatetool/archi.io/releases/download/#{version}/Archi-Mac#{arch}-#{version}.dmg",
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

  zap trash: "~/Library/Application Support/Archi"

  caveats do
    <<~EOS
      To remove application from quarantine execute the following command
        xattr -r -d com.apple.quarantine #{appdir}/Archi.app
      Or install cask using --no-quarantine option
    EOS
  end
end
