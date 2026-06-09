class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.25/robocode-v0.1.25-aarch64-apple-darwin.tar.gz"
      sha256 "0372c8961c52cea17136a1db06fe70bf5eceb243b895074c302b05baa7ca2326"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.25/robocode-v0.1.25-x86_64-apple-darwin.tar.gz"
      sha256 "4c8707076191fdc627a8cbd759e836c33045cced1f0d07a6ef1242514601d01e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.25/robocode-v0.1.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f50961547794714b1ecfe233cd583cbc5866279843fea730efc7ed10e1de72b"
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
