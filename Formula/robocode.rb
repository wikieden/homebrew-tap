class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.30/robocode-v0.1.30-aarch64-apple-darwin.tar.gz"
      sha256 "d522e16a92827144c95caada71573f29659d1be3d84930647664c86946c75d07"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.30/robocode-v0.1.30-x86_64-apple-darwin.tar.gz"
      sha256 "97fb1d85c82ae6d53cb03e37e8864fd14b58fc9a1b1d60f906c84117b5a3156c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.30/robocode-v0.1.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f717a9850f5a7432bc81117a270266d5a5df0349e42e9fcb4193c3c18f926892"
    end
  end

  def install
    binary = Pathname.glob("**/robocode-cli").find(&:file?)
    bin.install binary => "robocode"
    bin.install_symlink bin/"robocode" => "robocode-cli"
  end

  test do
    system bin/"robocode", "--help"
  end
end
