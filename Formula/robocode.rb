class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.7/robocode-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "ec000b139ede57d27035e9ba2ed95f111e3f6d0e40fe2c2c648b63d6fbf7a2a9"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.7/robocode-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "a50ceac337ffad807bb4ae6935ff5177a25f36e098eee10a91e0c1b9ce3b86bc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.7/robocode-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "758a38f4ef1a217e02b77647aa2ee22e049ce7bd214c55dbd8cd4e9b606065ae"
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
