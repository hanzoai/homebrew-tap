class Hanzo < Formula
  desc "AI engineer in your terminal: deploy and manage Hanzo Cloud"
  homepage "https://github.com/hanzoai/cli"
  version "1.9.18"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/hanzoai/cli/releases/download/v1.9.18/hanzo-darwin-arm64.tar.gz"
      sha256 "0ff748e1606ab431e76dff7b7c388ba1aea71827ca2452092a74c09d6bde4252"
    end
    on_intel do
      url "https://github.com/hanzoai/cli/releases/download/v1.9.18/hanzo-darwin-amd64.tar.gz"
      sha256 "1090ce84be9b435f8e0c8f35a3a42575429f4b3b73cb57baf98cb9b9ac58f135"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hanzoai/cli/releases/download/v1.9.18/hanzo-linux-arm64.tar.gz"
      sha256 "d963955714a6a3dd5571479e3851d9598bb400ff1a5fc12f0b72efa545d6c75c"
    end
    on_intel do
      url "https://github.com/hanzoai/cli/releases/download/v1.9.18/hanzo-linux-amd64.tar.gz"
      sha256 "16ba0bf487366f53537f17a9d425835cda3353b3f3ea82a1b1e70114615c2ebf"
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
