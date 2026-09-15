class Normlang < Formula
  desc "Statically typed programming language and toolchain"
  homepage "https://github.com/normlanguage/Norm"
  version "0.23.2"
  license "MPL-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/normlanguage/Norm/releases/download/v0.23.2/norm-v0.23.2-macos-arm64.tar.gz"
      sha256 "3ed2855bf1f606147691dc8df0fcc4c22fdfc127b992dbf0b063b97f5246fed1"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/normlanguage/Norm/releases/download/v0.23.2/norm-v0.23.2-linux-x64.tar.gz"
      sha256 "2465a590b40d2372ade8326219f8a0ee40d6c9454ff951044bf5a8891efbae0b"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/norm"
  end

  test do
    (testpath/"hello.norm").write <<~NORM
      Void main() {
        printLine("Hello from Norm")
      }
    NORM
    assert_equal "Hello from Norm\n", shell_output("#{bin}/norm run hello.norm")
    assert_equal "norm #{version}\n", shell_output("#{bin}/norm --version")
  end
end
