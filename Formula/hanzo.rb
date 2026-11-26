class Hanzo < Formula
  desc "AI coding agent and CLI for every Hanzo Cloud product"
  homepage "https://github.com/hanzoai/cli"
  version "8.5.1422"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-darwin-arm64.tar.gz"
      sha256 "c2aec4434d9cbab253f29965adfd336825e759b814960a15efc0ae6e24874a1b"
    end
    on_intel do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-darwin-amd64.tar.gz"
      sha256 "aec7823af18bb10c7d6cb16e67d271f568204a1a5384f749b6d71a5ecd34d03e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-linux-arm64.tar.gz"
      sha256 "9855f094efd1600b208096a38a9b53df9a9f0935958777515aaea028122cc349"
    end
    on_intel do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-linux-amd64.tar.gz"
      sha256 "244da223f99dd69f2f4624eab00f10ac22aa910a7982b394b68db1f6a43136f8"
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
