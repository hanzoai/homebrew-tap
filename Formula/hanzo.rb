class Hanzo < Formula
  desc "AI coding agent and CLI for every Hanzo Cloud product"
  homepage "https://github.com/hanzoai/cli"
  version "8.5.1453"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-darwin-arm64.tar.gz"
      sha256 "5ae3d4920fcdc952e5849a6f0d1e089ce5c042d1685f180201e39ce155662535"
    end
    on_intel do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-darwin-amd64.tar.gz"
      sha256 "afc3dc9927d28689ed70f8040d36726e93554d833acbd09036b67b33c0048bd1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-linux-arm64.tar.gz"
      sha256 "a2c331ee7e95e5d0ccd6d153092378463c6bc78437c5e7daeb865d69840236ab"
    end
    on_intel do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-linux-amd64.tar.gz"
      sha256 "f74fd2cb8cf42d55cd919de141d47bc52b27d3d2896b07bf08459016bb9a931f"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "hanzo"
    # `hanzo-cli` is not a second program: it is the name hanzoai/cloud's Go
    # control binary resolves FIRST when it delegates a verb it does not own
    # (cloud/cli/link.go fabricCLI -> HANZO_FABRIC_CLI, hanzo-cli, hanzo), and
    # the name hanzoai/cli's install.sh gives the same build. `hanzo-node` is
    # the network node, a different program, and is not written here.
    # A hanzo-cli at a different version than hanzo is an invisible stale
    # install: the user types `hanzo` and is silently handed an old build.
    # A symlink cannot drift the way a second copy can.
    bin.install_symlink bin/"hanzo" => "hanzo-cli"
  end

  test do
    expected = "hanzo #{version}"
    assert_equal expected, shell_output("#{bin}/hanzo --version").strip
    assert_equal expected, shell_output("#{bin}/hanzo-cli --version").strip
  end
end
