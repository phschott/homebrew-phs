cask "archi" do
  arch arm: "Silicon-"

  version "5.4.0"
  sha256 arm:   "603b531c08a2867509f52b042774d683b46cd66f0afffa580e6d0a9b20cdf0fa",
         intel: "d98dd38df475a650cc4e24a6a642430ecffdd57fce1d4287c96bf0e2f5cc93d6"

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
