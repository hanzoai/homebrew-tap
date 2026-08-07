class HanzoDev < Formula
  desc "Local AI coding agent for your terminal, powered by Hanzo AI"
  homepage "https://github.com/hanzoai/dev"
  version "0.6.93"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/hanzoai/dev/releases/download/v#{version}/dev-aarch64-apple-darwin.tar.gz"
      sha256 "50daa089de904c0806b3fd50eb5debb98f1dab88c70b9da77e6f027b7984491f"
    end
    on_intel do
      url "https://github.com/hanzoai/dev/releases/download/v#{version}/dev-x86_64-apple-darwin.tar.gz"
      sha256 "9fc7afa527d607476a700e2e1d872de347ff189d4b66db62d8199ab2113fad15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hanzoai/dev/releases/download/v#{version}/dev-aarch64-unknown-linux-musl.tar.gz"
      sha256 "49d234aaf8d9be3c0b10ca0ad998c39d9d66ced976ddb3d0cecc16355e1109e9"
    end
    on_intel do
      url "https://github.com/hanzoai/dev/releases/download/v#{version}/dev-x86_64-unknown-linux-musl.tar.gz"
      sha256 "df6f3e08d12ad7986e1f35426ae7f1e688d553341fe69575df23d16aa61ad1fb"
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
