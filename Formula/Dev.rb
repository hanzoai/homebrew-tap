class Dev < Formula
  desc "Hanzo Dev - AI coding assistant"
  homepage "https://github.com/hanzoai/dev"
  version "v0.6.83"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanzoai/dev/releases/download/v0.6.83/dev-aarch64-apple-darwin.tar.gz"
      sha256 "0df4d0714ca566ffcf0c236c2d4ddef5f56c3278e74b9e3c5b5216ce0f88108a"
    else
      url "https://github.com/hanzoai/dev/releases/download/v0.6.83/dev-x86_64-apple-darwin.tar.gz"
      sha256 "0e22fbb63d387ad5ce6f4f8b5df86dc71485d84d04e7ab35cd76e4d8a905a7aa"
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
