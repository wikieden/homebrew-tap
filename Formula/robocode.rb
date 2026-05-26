class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.6/robocode-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "5c2783b86574edf95a66af7b176ea6e3c24680782f53817d00661661397faac3"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.6/robocode-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "7229d9a2dcdd796735ccbde6dcfccac8d35a66454b76e42cca561242e3789c6a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.6/robocode-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b47d2648de98a72e2d9e0b8afef1a92090bb4325374d6f69086b7b790f9da77e"
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
