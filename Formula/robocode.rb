class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.19/robocode-v0.1.19-aarch64-apple-darwin.tar.gz"
      sha256 "156fcbe44a185419e3e0052a255a6a9e75abfeabf605e3c9d1e0255e1c6db444"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.19/robocode-v0.1.19-x86_64-apple-darwin.tar.gz"
      sha256 "ce01376438af03dd4e269e2b46d49e4db47569f050ff3a6d17a19c60a96feefe"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.19/robocode-v0.1.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1dde3f9cb30943b86135e7eb7b7ed3f148434462016c9f518376839cceab5741"
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
