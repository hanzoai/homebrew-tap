class HanzoDev < Formula
  desc "Hanzo Dev - AI coding assistant"
  homepage "https://github.com/hanzoai/dev"
  version "v0.6.83"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanzoai/dev/releases/download/v0.6.83/dev-aarch64-apple-darwin.tar.gz"
      sha256 "c8e8ca4e44fb0380d4dd73d5c19af5b38e3fdedbbf4cada9be9d5a93d197fd1b"
    else
      url "https://github.com/hanzoai/dev/releases/download/v0.6.83/dev-x86_64-apple-darwin.tar.gz"
      sha256 "9332c6a5e06a9c79e8cd6c786e34bf69d7fa37a64a5aeaf8772202505ce1ade7"
    end
  end

  def install
    bin.install Dir["dev-*"].first => "dev"
    # Provide a compatibility shim
    (bin/"hanzo").write <<~EOS
      #!/bin/bash
      exec "#{bin}/dev" "$@"
    EOS
  end

  test do
    system "#{bin}/dev", "--help"
  end
end
