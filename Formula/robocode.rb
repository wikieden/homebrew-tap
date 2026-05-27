class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.10/robocode-v0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "9240033909918303395a42b107f1a82be84fc95ecb167564167bae07e29e454d"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.10/robocode-v0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "7e0e19a3a81b3cd4c1920c1fee4d40e1b0af265878655e57516175a61724e61a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.10/robocode-v0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b4bbe0cb83c39a634aeb5d48b80049322bc925fd513f326ae30ccdaf844e9926"
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
