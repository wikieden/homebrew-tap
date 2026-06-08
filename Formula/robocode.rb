class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.24/robocode-v0.1.24-aarch64-apple-darwin.tar.gz"
      sha256 "570ed226c1e00018e3ffb160ac175d414338213b2b51caf396f862e4749bc047"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.24/robocode-v0.1.24-x86_64-apple-darwin.tar.gz"
      sha256 "667a2c1129b427b69c95db01f7b0afc6cb1609e9c50f58fde7e8f9ef667a2f2e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.24/robocode-v0.1.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2025f4beb19448e9064071883c61173518094fe13089d809e69454576185bed4"
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
