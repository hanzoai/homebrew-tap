class Hanzo < Formula
  desc "AI coding agent and CLI for every Hanzo Cloud product"
  homepage "https://github.com/hanzoai/cli"
  version "8.5.930"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-darwin-arm64.tar.gz"
      sha256 "47f536cb099aa18dd5a7063fae89ce678267dee76a93ae64b2f3bf4dbd0dbe9a"
    end
    on_intel do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-darwin-amd64.tar.gz"
      sha256 "65e471202629eab01658f23c6260d905e3bb4e6bed51436ae3d0411f94c9e8c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-linux-arm64.tar.gz"
      sha256 "5e5646df1d89343f5c682f16b8ae33a004d9f6cc84abb52f8bef3df43eba4aec"
    end
    on_intel do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-linux-amd64.tar.gz"
      sha256 "0c517bb1e938b255da2413126d56c581401db9f472e70669832d50ec87ce0ac5"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "hanzo"
    # `hanzo-node` is not a second program: it is the name hanzoai/cloud's Go
    # control binary resolves FIRST when it delegates a verb it does not own
    # (cloud/cli/link.go fabricCLI -> HANZO_FABRIC_CLI, hanzo-node, hanzo).
    # A hanzo-node at a different version than hanzo is an invisible stale
    # install: the user types `hanzo` and is silently handed an old build.
    # A symlink cannot drift the way a second copy can.
    bin.install_symlink bin/"hanzo" => "hanzo-node"
  end

  test do
    expected = "hanzo #{version}"
    assert_equal expected, shell_output("#{bin}/hanzo --version").strip
    assert_equal expected, shell_output("#{bin}/hanzo-node --version").strip
  end
end
