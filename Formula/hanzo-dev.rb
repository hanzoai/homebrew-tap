class HanzoDev < Formula
  desc "Hanzo Dev - AI coding assistant"
  homepage "https://github.com/hanzoai/dev"
  version "v0.6.83"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hanzoai/dev/releases/download/v0.6.83/dev-aarch64-apple-darwin.tar.gz"
      sha256 "efbe2d8e3acd2af832b548240697f2bf2fd775fcd9221306368546c10819aa90"
    else
      url "https://github.com/hanzoai/dev/releases/download/v0.6.83/dev-x86_64-apple-darwin.tar.gz"
      sha256 "318cb35f837a8bbc72d0e68ef140b5b4f9680a595bbfd7c0f204dd4073d9039b"
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
