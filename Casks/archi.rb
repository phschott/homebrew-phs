cask "archi" do
  arch arm: "Silicon-"

  version "5.3.0"
  sha256 arm:   "89ccc8526d4b0808d828ec875db14281bfb3a14c7101348e56407c2dd93ba714",
         intel: "74bd5cec8adb0cc63f59b8a3421d5d0a60ab4504218f87e318dfba9b5f4e8ced"

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
