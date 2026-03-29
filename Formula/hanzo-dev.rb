class HanzoDev < Formula
  desc "AI-powered development assistant from Hanzo AI"
  homepage "https://github.com/hanzoai/dev"
  version "0.6.83"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanzoai/dev/releases/download/v#{version}/dev-aarch64-apple-darwin.tar.gz"
      sha256 "7ea7dee24c55460468804d58964b10f0d63bc797178b9ac389790d5d9516b772"
    else
      url "https://github.com/hanzoai/dev/releases/download/v#{version}/dev-x86_64-apple-darwin.tar.gz"
      sha256 "1893fe848c3ef598e9945436fced5e62b43c8c88084432dc0376f4dabec59325"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hanzoai/dev/releases/download/v#{version}/dev-aarch64-unknown-linux-musl.tar.gz"
      sha256 "be75e87c7232fe6122cca9a60700973c42b61f97e918e46b2ad4850f5b3a8e69"
    else
      url "https://github.com/hanzoai/dev/releases/download/v#{version}/dev-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4efc2e2ae5d6070d4e0e6120ead6d98f8d2209edcd1987951b79b8d7601a583f"
    end
  end

  def install
    bin.install "dev" => "hanzo-dev"
    # Also install as 'dev' for convenience
    bin.install_symlink "hanzo-dev" => "dev"
  end

  test do
    assert_match "hanzo dev", shell_output("#{bin}/hanzo-dev --version")
  end
end
