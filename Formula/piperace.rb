class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.15"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.15/piperace-darwin-arm64"
      sha256 "c7a364b9d11c265f6114d59a8ea0b21ef5da79c3c43e51387a2803421aa6ea8a"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.15/piperace-darwin-amd64"
      sha256 "beb2219c1cf1bd95252fad62c2cf1b38d2f7ad5d33f36d270753949f1e60a72d"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.15/piperace-linux-arm64"
      sha256 "74d0b46d3c6ef23787cb53a3414e3bb91999fba8c9ee1dfb1fed9f6d61490161"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.15/piperace-linux-amd64"
      sha256 "1e7f6bfeab37cb5a2277fd250df63c5cbc0dc1e7ccebde56c20f6984d5619238"
    end
  end

  def install
    binary = Dir["piperace-*"].first
    bin.install binary => "piperace"
    chmod 0755, bin/"piperace"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/piperace --version")
  end
end
