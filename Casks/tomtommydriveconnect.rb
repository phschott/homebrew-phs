cask "tomtommydriveconnect" do
  version "4.3.4.5022"
  sha256 "467d8dbe260b8d0152bc8e31109d84c684511e2dc46f90f294865bb793e7417f"

  url "https://cdn.sa.services.tomtom.com/static/sa/Mac/TomTomMyDriveConnect.dmg"
  name "TomTom My Drive Connect"
  desc "TomTom My Drive Connect"
  homepage "https://www.tomtom.com"
  
  livecheck do
    skip "No version information available"
  end

  auto_updates true

  pkg "MyDriveConnect.mpkg"

  uninstall pkgutil: "com.tomtom.mytomtomsa.pkg"
  uninstall pkgutil: [
    "com.tomtom.mytomtomsa.pkg",
    "com.tomtom.mytomtomsa.temp.pkg"
  ],
  delete:  "/Applications/TomTom MyDrive Connect.app"

  zap trash: [
    "~/Library/Application Support/TomTom"
  ]
end
