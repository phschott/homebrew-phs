class DcevmAT11 < Formula
  desc "Toolkit for the Dynamic Code Evolution Virtual Machine (DCEVM)"
  homepage "https://dcevm.github.io/"
  url "https://github.com/TravaOpenJDK/trava-jdk-11-dcevm/releases/download/dcevm-11.0.15+1/Openjdk11u-dcevm-mac-x64.tar.gz"
  version "11.0.15+1"
  sha256 "a527432fc2eba32d0bc61c0b2653542be251329c33c86f023ebe02bf3ec72c23"
  license "Apache-2.0"

  livecheck do
    url "https://github.com/TravaOpenJDK/trava-jdk-11-dcevm/releases"
    regex(/href=.*?dcevm-?([0-9a-z.%]+)/i)
    strategy :page_match do |page, regex|
      page.scan(regex)
          .map { |match| match&.first&.gsub("%2B", "+") }
    end
  end

  keg_only :versioned_formula

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/Contents/Home/bin/*"]
    include.install_symlink Dir["#{libexec}/Contents/Home/include/*.h"]
    include.install_symlink Dir["#{libexec}/Contents/Home/include/darwin/*.h"]
  end

  def caveats
    <<~EOS
      For the system Java wrappers to find this JDK, symlink it with
        sudo ln -sfn #{opt_libexec} /Library/Java/JavaVirtualMachines/dcevm-11.jdk
    EOS
  end
end
