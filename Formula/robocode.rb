class Robocode < Formula
  desc "Local-first coding agent CLI with a cockpit-style terminal UI"
  homepage "https://github.com/wikieden/robocode"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.12/robocode-v0.1.12-aarch64-apple-darwin.tar.gz"
      sha256 "742f35c18fa6d3ce5ca8aa6b07c533d342da4c36fa1a537e2533cbb5cafb7fea"
    else
      url "https://github.com/wikieden/robocode/releases/download/v0.1.12/robocode-v0.1.12-x86_64-apple-darwin.tar.gz"
      sha256 "90080342d49c431c55b72103f54a06a43f7a48780e8bded8ab088f09e1a234dd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wikieden/robocode/releases/download/v0.1.12/robocode-v0.1.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec39e329cae56e42f3f77a3d844ff84cea9d2721fb61780fb60fcf42d79ccd8e"
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
