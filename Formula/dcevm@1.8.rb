class DcevmAT18 < Formula
  desc "Toolkit for the Dynamic Code Evolution Virtual Machine (DCEVM)"
  homepage "https://dcevm.github.io/"
  url "https://github.com/TravaOpenJDK/trava-jdk-8-dcevm/releases/download/dcevm8u282b08/java8-openjdk-dcevm-osx.tar.gz"
  version "8u282b08"
  sha256 "12e243ea54440f7eb899a24330b652178cf618e69c063333e3f23cb323f2fbce"
  license "Apache-2.0"

  livecheck do
    url "https://github.com/TravaOpenJDK/trava-jdk-8-dcevm/releases"
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
        sudo ln -sfn #{opt_libexec} /Library/Java/JavaVirtualMachines/dcevm-8.jdk
    EOS
  end
end
