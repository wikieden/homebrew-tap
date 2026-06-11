class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.29/robocode-v0.1.29-aarch64-apple-darwin.tar.gz"
      sha256 "a61292a431f8415f11d5b1ff71e0831114c1e18fb6707865805c428e852ddab6"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.29/robocode-v0.1.29-x86_64-apple-darwin.tar.gz"
      sha256 "037be4a294a1624ea651ea946014c17acc7dd4687a3a7c06bc215da493c63a7c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.29/robocode-v0.1.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c6cde99fde2cf223aa9e556aac6aae928b3741807841dcbd73b40850f6496fa2"
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
