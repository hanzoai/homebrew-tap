class Hanzo < Formula
  desc "AI engineer in your terminal: deploy and manage Hanzo Cloud"
  homepage "https://github.com/hanzoai/cli"
  version "1.9.12"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/hanzoai/cli/releases/download/v1.9.12/hanzo-darwin-arm64.tar.gz"
      sha256 "2b93709359ea0bd528cce616e2539a2be12ab4f4656f34ba2a16d7ab41a147f3"
    end
    on_intel do
      url "https://github.com/hanzoai/cli/releases/download/v1.9.12/hanzo-darwin-amd64.tar.gz"
      sha256 "80b4016d4b7b819b526f07190608f0a5eab8331d7f16fd9861b6c80928a0aec4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hanzoai/cli/releases/download/v1.9.12/hanzo-linux-arm64.tar.gz"
      sha256 "04e1d823186224f8d612ecd380abf03c49a4fc1b178e2658ed78db07bdb5ea53"
    end
    on_intel do
      url "https://github.com/hanzoai/cli/releases/download/v1.9.12/hanzo-linux-amd64.tar.gz"
      sha256 "7ae73e6b1853a002cb13db4208746e80cc8277e06e7423c17208209a8b641bbe"
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
