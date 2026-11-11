class HanzoDev < Formula
  desc "Local AI coding agent for your terminal, powered by Hanzo AI"
  homepage "https://github.com/hanzoai/dev"
  version "0.7.16"
  license "Apache-2.0"

  depends_on "hanzoai/tap/hanzo-mcp"

  on_macos do
    on_arm do
      url "https://github.com/hanzoai/dev/releases/download/v#{version}/dev-aarch64-apple-darwin.tar.gz"
      sha256 "37aecd679a402fb162d391113fb01859bc3bed175bb6c7c42eb41d7f1bd2704b"
    end
    on_intel do
      url "https://github.com/hanzoai/dev/releases/download/v#{version}/dev-x86_64-apple-darwin.tar.gz"
      sha256 "3068c8032862bc7802f482ca81099d59e904b5e4bd1602ec8c465d9e81cf957e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hanzoai/dev/releases/download/v#{version}/dev-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1578ba2f77b514ea912eb0a5b4f4351ec7227e1d4f0eecae771f298554cc6818"
    end
    on_intel do
      url "https://github.com/hanzoai/dev/releases/download/v#{version}/dev-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9285d6f16388ec86861015cc7c125dc42f8ee2fa519ebd667d37dba4799dad50"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
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
