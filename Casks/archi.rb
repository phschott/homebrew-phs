cask "archi" do
  arch arm: "-Silicon"

  version "5.9.0"
  sha256 arm:   "3d6f49b780783f2a0268e7186a35380ab060e3656087257913b28e07ebac14cf",
         intel: "a061e25b7bb2b8f276cb32366745fc96b251168bb5cac50c38ef51a37cbf9448"

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
  depends_on macos: :big_sur

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
