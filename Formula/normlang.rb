class Normlang < Formula
  desc "Statically typed programming language and toolchain"
  homepage "https://github.com/normlanguage/Norm"
  version "0.24.0"
  license "MPL-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/normlanguage/Norm/releases/download/v0.24.0/norm-v0.24.0-macos-arm64.tar.gz"
      sha256 "f14c86c9248b816a22eab3c6dd98c2d768589c82685fc8adcaad75fa70841622"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/normlanguage/Norm/releases/download/v0.24.0/norm-v0.24.0-linux-x64.tar.gz"
      sha256 "ff66a5b055bad8648f11462887a57b42de59f0e43e967058ef8ebc767d64432a"
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
