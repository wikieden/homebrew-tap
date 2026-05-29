class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.16/robocode-v0.1.16-aarch64-apple-darwin.tar.gz"
      sha256 "df7591abfc8282897ff78a51e02bcee9c2db98a893fbce30adce9cf9947beab5"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.16/robocode-v0.1.16-x86_64-apple-darwin.tar.gz"
      sha256 "be8b814e04771bae9ae03e08e177dd36b217639e629bd817b9e4cf07d602981e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.16/robocode-v0.1.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "02cb651ded2e19fabfc6b681ba9596d5c94aa25555f5b216153e71bebcb53099"
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
