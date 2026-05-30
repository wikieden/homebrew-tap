class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.20/robocode-v0.1.20-aarch64-apple-darwin.tar.gz"
      sha256 "106679223a258d1d93a3e3eee00912997047663fcc5ffb1c02eb7ae037ff22df"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.20/robocode-v0.1.20-x86_64-apple-darwin.tar.gz"
      sha256 "b34298a3e228f17af85bd56ca3442bc8dec5ab19cd7e1d1c521965b3b03f4ee0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.20/robocode-v0.1.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0248677ec4dcd2bf15d663b80789245b3f4c5158bddea3c62f176d4547b9d192"
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
