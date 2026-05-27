class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.8/robocode-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "8d29553924876c30343ad7a17488a51687a5868def2c9b4468570741d7dc4161"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.8/robocode-v0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "a950a2c9cc81620049780c0ea2bafc433dd26343513b2909dbe31e33961ec8b5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.8/robocode-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ddd7ffaf3a33b64e614defb69b4acb6053e4a944835b59e7f2e5672b266d6fb7"
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
