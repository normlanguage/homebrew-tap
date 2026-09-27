class Normlang < Formula
  desc "Statically typed programming language and toolchain"
  homepage "https://github.com/normlanguage/Norm"
  version "0.25.0"
  license "MPL-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/normlanguage/Norm/releases/download/v0.25.0/norm-v0.25.0-macos-arm64.tar.gz"
      sha256 "89e75fe1090308ccee9cbbae9b18c724763088b47c13835e05ebd762453e24f4"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/normlanguage/Norm/releases/download/v0.25.0/norm-v0.25.0-linux-x64.tar.gz"
      sha256 "e72cdee5879fe6eb133e06ed9cb1db4e602e0061621c31f9d0d6d77d2cef5b66"
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
