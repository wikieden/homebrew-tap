class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.21/robocode-v0.1.21-aarch64-apple-darwin.tar.gz"
      sha256 "ac16ecf8d93c0f83d1149116d197d0dbf65f7a8a15a7c3cdd4c3e509df13e105"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.21/robocode-v0.1.21-x86_64-apple-darwin.tar.gz"
      sha256 "f66c7ad39243ee03ce75731a4741c1cc6f59d21ec4f4e8f977ed30266cda39f4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.21/robocode-v0.1.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e0c6be7034498ac0f0b5072d393ab0e343dce182042da7a12b94ee88bd21869d"
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
