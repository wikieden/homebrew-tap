class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.27/robocode-v0.1.27-aarch64-apple-darwin.tar.gz"
      sha256 "5b2d9fb7c006c3c82981b336fba0255b6bdf50ba07d69a9d4d108eb9d848af0f"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.27/robocode-v0.1.27-x86_64-apple-darwin.tar.gz"
      sha256 "080f13f25a174ea9593ed5bc3e72799cf102e4ccfeffaa2239939e13c5f18b19"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.27/robocode-v0.1.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a0fb575c1d98e59d1416df191a2742b54a38f42f81661d4840523fc1e090034"
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
