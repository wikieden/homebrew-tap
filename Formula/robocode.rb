class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.3/robocode-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "53ff988ec8bdd6e1f97b87062d48fcfb25fff089781cb3f3817531252789c115"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.3/robocode-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "9931cd9832d536a578ce3232f82ada62625f501056256af2f5674e8ffadb0fbb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.3/robocode-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc545b6e7350e3a318dc8a98c21c82bf77c14b328d942d96bf11e9d9a8744306"
    end
  end

  def install
    binary = Pathname.glob("**/robocode-cli").find(&:file?)
    bin.install binary => "robocode"
    bin.install_symlink bin/"robocode" => "robocode-cli"
  end

  test do
    system "#{bin}/robocode", "--help"
  end
end
