class Hanzo < Formula
  desc "AI coding agent and CLI for every Hanzo Cloud product"
  homepage "https://github.com/hanzoai/cli"
  version "8.5.929"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-darwin-arm64.tar.gz"
      sha256 "3f5e3ee1aaa0bc894196027b1cbe8ac10e04804b54187a64f64fd0ced5b5e544"
    end
    on_intel do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-darwin-amd64.tar.gz"
      sha256 "ec9aad25e9c2fe3484bb8fbd0b787f4dd9b59f1fb81f7ceecf449ab76d7f325d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-linux-arm64.tar.gz"
      sha256 "0a0f9764d417e238ae2d989a1da7d87235b692e8a64892409f796d3c5b8478c4"
    end
    on_intel do
      url "https://github.com/hanzoai/cli/releases/download/v#{version}/hanzo-linux-amd64.tar.gz"
      sha256 "19fc99846559f8dfe7a5ce3a9fdcd20d6da5ef7ecc96693359615514dc17dfb4"
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
