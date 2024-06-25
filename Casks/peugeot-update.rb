cask "peugeot-update" do
  version "1.6.1"
  sha256 :no_check

  url "https://d1tik0o5ahgjm.cloudfront.net/peugeot/peugeot_update.dmg",
      verified: "d1tik0o5ahgjm.cloudfront.net/peugeot/"
  name "Peugeot Update"
  desc "Update Peugeot system"
  homepage "https://www.peugeot.fr/"

  livecheck do
    skip "No version information available"
  end

  auto_updates true

  app "Peugeot Update.app"

  zap trash: [
    "~/Library/Application Support/Peugeot Update",
    "~/Library/Preferences/com.peugeot.update.plist",
  ]
end
