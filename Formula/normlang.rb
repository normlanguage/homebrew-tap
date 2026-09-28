class Normlang < Formula
  desc "Statically typed programming language and toolchain"
  homepage "https://github.com/normlanguage/Norm"
  version "0.25.4"
  license "MPL-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/normlanguage/Norm/releases/download/v0.25.4/norm-v0.25.4-macos-arm64.tar.gz"
      sha256 "2907a91ef2c20db85eaebe60df1bb6c311b6586541c867c3e1acabcee3a5ee01"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/normlanguage/Norm/releases/download/v0.25.4/norm-v0.25.4-linux-x64.tar.gz"
      sha256 "501be29f34f1bc152ed4340e7c23437e9353f9a7e9f876f4f1c57f0e4adb197a"
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
