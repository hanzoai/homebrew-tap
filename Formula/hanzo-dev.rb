class HanzoDev < Formula
  desc "Hanzo Dev - AI coding assistant"
  homepage "https://github.com/hanzoai/dev"
  version "v0.6.83"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanzoai/dev/releases/download/v0.6.83/dev-aarch64-apple-darwin.tar.gz"
      sha256 "8457172744747b55fce70f1b879317c761256e4a88df41e82d33584836a71812"
    else
      url "https://github.com/hanzoai/dev/releases/download/v0.6.83/dev-x86_64-apple-darwin.tar.gz"
      sha256 "84e6d618022bb1b3d018d20917f52a50a4e02044fa87051ee0dcce816b99bbd6"
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
