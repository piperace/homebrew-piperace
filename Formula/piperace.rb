class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.5.29"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.29/piperace-darwin-arm64"
      sha256 "7ab44226d99da56eed93a0a6f3442301fcd6d19d729c9802768940d7ba1f822b"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.29/piperace-darwin-amd64"
      sha256 "51b521f003155b5aa36e5caf14f3f1ec6a6d67b23bc1581d94659a20edd6ca87"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.29/piperace-linux-arm64"
      sha256 "1f65b58e8c60bcfb109b589c5f4a4a045eaba3f8505d244dbc5a5034a0f6fb17"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.29/piperace-linux-amd64"
      sha256 "277133002eda9b5865cb1e1de8e355d2260018677fc59d5ecfc3a8af2f8a02aa"
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
