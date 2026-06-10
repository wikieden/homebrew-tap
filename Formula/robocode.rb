class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.28/robocode-v0.1.28-aarch64-apple-darwin.tar.gz"
      sha256 "ef335b541976644993dd42883ffcc964143be665718d0fc66657da65757a11c9"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.28/robocode-v0.1.28-x86_64-apple-darwin.tar.gz"
      sha256 "532e7ef38d4bf2fcda2a84d23c7c45cbe9c576cd100425f23eb490c55bb1852e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.28/robocode-v0.1.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ebd47d9ef2669b8d1102a4901fafedba3e0cd537acb91d66350c27f3a8e060be"
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
