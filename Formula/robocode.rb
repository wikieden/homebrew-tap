class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.13/robocode-v0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "9fe9e3f267e13fb74d92602fceb91c5f654f0907cf951df2383724b6b7c9e442"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.13/robocode-v0.1.13-x86_64-apple-darwin.tar.gz"
      sha256 "a31e1f61e40d3d1e6da313118d0185e0ff103c2cd1ddaf3a235fc52d955e0140"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.13/robocode-v0.1.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "23fc0c0f695633545f3c9b365dacb8e3a5db08d017c5205a7f888ec7b89290b4"
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
