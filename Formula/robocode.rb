class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.18/robocode-v0.1.18-aarch64-apple-darwin.tar.gz"
      sha256 "34888c6e2d187d215dcdac05cfa738ac149b9121b31363854df5303f3c44614d"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.18/robocode-v0.1.18-x86_64-apple-darwin.tar.gz"
      sha256 "343e3b8d13fb98a77e2da7cd1d85029d70a1581c29e5f4ddc83c2fffa410ec74"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.18/robocode-v0.1.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "078d9b11ca25395607a0ee310d9bd50745cd04f4f9bb0ed13f4aaa4da6d65566"
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
