cask "apache-directory-studio@m16" do
  version "2.0.0.v20210213-M16"
  sha256 "aeb174447146c5a7b53158047f566ce63a93fbeef06e2efb4c9567930210bf2e"

  url "https://archive.apache.org/dist/directory/studio/#{version}/ApacheDirectoryStudio-#{version}-macosx.cocoa.x86_64.dmg",
      verified: "archive.apache.org"
  name "Apache Directory Studio"
  desc "Eclipse-based LDAP browser and directory client"
  homepage "https://directory.apache.org/studio/"

  livecheck do
    url :url
    regex(%r{href=["']?v?(\d+(?:\.\d+)+[^/]*?)/?["' >]}i)
  end

  auto_updates false

  app "ApacheDirectoryStudio.app"

  zap trash: "~/.ApacheDirectoryStudio"

  caveats do
    depends_on_java "11+"
    requires_rosetta
    <<~EOS
      To set the Java VM to use:

        https://directory.apache.org/studio/faqs.html#how-to-set-the-java-vm-to-use
    EOS
  end
end
