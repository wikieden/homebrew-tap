class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.22/robocode-v0.1.22-aarch64-apple-darwin.tar.gz"
      sha256 "6e98839b3a6ee94918c25f303e7011adcb4948e920c5bc8de4cc1673557c3869"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.22/robocode-v0.1.22-x86_64-apple-darwin.tar.gz"
      sha256 "cf467cf07ba245191e5c34cf59e4b5128797beb2c76c7e5f4d60e3f54294b2fc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.22/robocode-v0.1.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d83bf1465b626ac3a198953c40448b874ca812683ac10ec3b115cf31eb1e287b"
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
