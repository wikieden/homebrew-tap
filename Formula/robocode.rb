class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.26/robocode-v0.1.26-aarch64-apple-darwin.tar.gz"
      sha256 "0cbb5472072332f7de6ccec48dc1d2d73dceb703d6aad5addae0057377495bb9"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.26/robocode-v0.1.26-x86_64-apple-darwin.tar.gz"
      sha256 "9c5c3312c83e7eef01140dcfe6e208ab9b0dfb59f3e471c49e8458f9d1fa5b7c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.26/robocode-v0.1.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6460359fb8c71d1634b8e451baebc166b9d6dd59738cc89663fb1bf994380962"
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
