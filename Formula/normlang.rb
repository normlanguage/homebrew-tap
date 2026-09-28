class Normlang < Formula
  desc "Statically typed programming language and toolchain"
  homepage "https://github.com/normlanguage/Norm"
  version "0.25.3"
  license "MPL-2.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/normlanguage/Norm/releases/download/v0.25.3/norm-v0.25.3-macos-arm64.tar.gz"
      sha256 "d8a62670355cef0ad1911c86e16504aa0d42a72aa9ea805229ff56b102c2ed62"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/normlanguage/Norm/releases/download/v0.25.3/norm-v0.25.3-linux-x64.tar.gz"
      sha256 "2765043908528b55fe0ff08feee642b1cf18a6dc663f66ffd040d83d8b2a28df"
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
