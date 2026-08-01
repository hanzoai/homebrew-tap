class HanzoDev < Formula
  desc "Hanzo Dev - AI coding assistant"
  homepage "https://github.com/hanzoai/dev"
  version "v0.6.83"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanzoai/dev/releases/download/v0.6.83/dev-aarch64-apple-darwin.tar.gz"
      sha256 "2a4f5eb12bba0aac65f7d9cc7d577ea962913bea9c4ef2a21b2a4825fc814913"
    else
      url "https://github.com/hanzoai/dev/releases/download/v0.6.83/dev-x86_64-apple-darwin.tar.gz"
      sha256 "264992535a1c7f027fb67769baaa7183ca24155f45bb7519302dc3ebfd30739d"
    end
  end

  def install
    # Installs `dev` ONLY. It must not also write a `hanzo` shim: `hanzo` is the
    # Hanzo CLI (Formula/hanzo.rb), a different program. A shim here would make
    # `hanzo` mean "the dev coding assistant" for anyone who installed this
    # formula first, and would collide with hanzo.rb on the same filename.
    bin.install Dir["dev-*"].first => "dev"
  end

  test do
    system "#{bin}/dev", "--help"
  end
end
