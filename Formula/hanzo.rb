class Hanzo < Formula
  desc "AI coding agent and CLI for every Hanzo Cloud product"
  homepage "https://github.com/hanzoai/cli"
  version "8.5.171"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-darwin-arm64.tar.gz"
      sha256 "e3ff363bc55262cb28b4c1051e5d1f3d492a8bb75f0a1b04b30490cd44e7ceb1"
    end
    on_intel do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-darwin-amd64.tar.gz"
      sha256 "03cf9b5043002361b4617fd8800f2bdd893d2822e019ff93794ea099455aa2be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-linux-arm64.tar.gz"
      sha256 "261fd506259e9569c6ce4252d011ca3cc626b946a88d96bf1b73fda7bde9ed3d"
    end
    on_intel do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-linux-amd64.tar.gz"
      sha256 "28470b3b456551e8899218e3464ff3b46c8c68489468e2c756f6e28503a91b01"
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
