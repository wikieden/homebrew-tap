class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.11/robocode-v0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "05b4a3f9c75380b406664498c1abe5376366b7687e3a5a5502550244e68cb644"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.11/robocode-v0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "d7a6f2f6bf3f43e8f434b214b680537dd52c59e0d26478ba62a512ffe6a2e152"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.11/robocode-v0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "292b3c7aa3c21dfde1184383031772173ad7f19155426eca5dc41976f6a0e1f7"
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
