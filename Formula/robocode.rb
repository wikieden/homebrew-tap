class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.17/robocode-v0.1.17-aarch64-apple-darwin.tar.gz"
      sha256 "eaf0d02b6e7666b963ad20bb888616362e7bb02ba82504d729c2721db42c88b5"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.17/robocode-v0.1.17-x86_64-apple-darwin.tar.gz"
      sha256 "c682906f44c4374d29f2e1a7ddc4b1587309b612ebd6617528b31cf15d9d492d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.17/robocode-v0.1.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb4c51a491a2550ea8a0bfce85ddae5657428b2b3a612e9c32b50bcad7f84250"
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
