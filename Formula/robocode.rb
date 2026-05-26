class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.5/robocode-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "a45984fd9f8907fd1379e22a3fa1fe1123a58a05b26c149cd05466b1a5c18026"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.5/robocode-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "cd2d5cd03ee0e3db67347d89f41cfac616620c26a897d033c34f8816d9448c3e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.5/robocode-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "197013fd0648e993b60192b0567ca5385798996f4df2bb40f83e4ca090a3b38f"
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
