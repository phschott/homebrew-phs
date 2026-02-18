COARCHI_VERSION = "0.9.5".freeze
COARCHI2_VERSION = "1.3.3".freeze
JARCHI_VERSION = "1.11.0".freeze
REPORTS_PLUGIN_VERSION = "5.7.0.202509230807".freeze
APP_LIB_FOLDER = "~/Library/Application Support/Archi".freeze

# Define custom method in Utils namespace
module Utils
  # Apply patch file
  def self.apply_patch(target_folder, patch_file)
    FileUtils.mkdir_p target_folder + "/templates/html/img"
    output = `patch --directory=#{target_folder} < #{patch_file}`
    puts output
  end

  # Replace string in one file
  def self.change_on_file(file, text_to_replace, text_to_put_in_place)
    text= File.read file
    File.open(file, "w+") { |f| f << text.gsub(text_to_replace, text_to_put_in_place) }
  end

  # Install plugins
  def self.install_plugins(tgt_folder, src_folder)
    FileUtils.mkdir_p tgt_folder + "/dropins"
    system("unzip", "-q", "-o", src_folder + "/dropins/coArchi_#{COARCHI_VERSION}.archiplugin", "-x",
           "archi-plugin", "-d", tgt_folder + "/dropins")
    system("unzip", "-q", "-o", src_folder + "/dropins/coArchi2_#{COARCHI_VERSION}.archiplugin", "-x",
           "archi-plugin", "-d", tgt_folder + "/dropins")
    system("unzip", "-q", "-o", src_folder + "/dropins/jArchi_#{JARCHI_VERSION}.archiplugin", "-x",
           "archi-plugin", "-d", tgt_folder + "/dropins")
  end
end

cask "archi@test" do
  arch arm: "-Silicon"

  version "5.7.0"
  sha256 arm:          "dbfc38f9a29f8df4c62e38e5fe73a8b85b67bfbfe48e67dece4ae649ae1a6e57",
         intel:        "c0896127a5e684be6b31be73c07258c1a982c15d773cae77c22f6e1172206b92",
         x86_64_linux: "0"

  url "https://github.com/archimatetool/archi.io/releases/download/#{version}/Archi-Mac-#{arch}#{version}.dmg",
      verified: "github.com/archimatetool/archi.io/"
  name "Archi"
  desc "Open-source ArchiMate modelling toolkit"
  homepage "https://www.archimatetool.com/"

  livecheck do
    url "https://www.archimatetool.com/download"
    regex(%r{href=.*?/Archi-Mac[._-]?(\d+(?:\.\d+)*)\.dmg}i)
  end

  auto_updates false
  conflicts_with cask: "archi"
  depends_on macos: ">= :big_sur"

  app "Archi.app"

  postflight do
    # Define script variables
    @cask_folder = __dir__.freeze # Path to Cask folder
    @src_folder = "#{@cask_folder}/Archi".freeze # Path to Archi specific in Cask folder
    @tgt_folder = File.expand_path(APP_LIB_FOLDER.to_s).freeze # Application Support folder
    @app_base_folder = "#{appdir}/Archi.app/Contents/Eclipse".freeze # App Config folder
    @template_folder = "#{@app_base_folder}/plugins/com.archimatetool.reports_#{REPORTS_PLUGIN_VERSION}".freeze

    # Add plugins in dropins folder
    ohai "Installing plugins..."
    Utils.install_plugins(@tgt_folder.to_s, @src_folder.to_s)
  end

  zap trash: "~/Library/Application Support/Archi"

  caveats do
    <<~EOS
      To remove application from quarantine execute the following command
        xattr -r -d com.apple.quarantine #{appdir}/Archi.app
      Or install cask using --no-quarantine option
    EOS
  end
end
