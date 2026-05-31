class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.23/robocode-v0.1.23-aarch64-apple-darwin.tar.gz"
      sha256 "0d50e46ffcfaf6e929f75d5963f72dbd4c39fb3d1d472408f7aa8f3e269a696a"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.23/robocode-v0.1.23-x86_64-apple-darwin.tar.gz"
      sha256 "e0470a4da13cd7178b6038e3455a2409fbfa398d39e9013eaa74557c69356905"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.23/robocode-v0.1.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "74c2f43bdaaeecf7a942159573a42d30e6c46b05e53d3fea3a0c18c0e0685a96"
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
