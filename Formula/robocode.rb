class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.9/robocode-v0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "24f2994105231f59aec264090155acb1048b9d635435509ca7fba730f7c65f22"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.9/robocode-v0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "58551b8f5f385332399b69f00e7ee0543fff9d6b4a6cf579ecbbe91ea85ba40c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.9/robocode-v0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da362a27b4ae6f3602bf3b6ea817a17edd4f0c303fc8136c75bccc41c3da14d2"
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
