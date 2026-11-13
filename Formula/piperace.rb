class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.14"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.14/piperace-darwin-arm64"
      sha256 "90cfc635f86366386dec79e9c8868065fafce8f3f30a7bb2cc0ecd7860875bcf"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.14/piperace-darwin-amd64"
      sha256 "1b5835a91ff095ad5026ad64c6737a2514766eea718edebb78ebe8d26e0d2e1e"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.14/piperace-linux-arm64"
      sha256 "b4e8fe6b3252d131a13ebbb398c2cdf0978f74c915d743fdfc691643e9d8940b"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.14/piperace-linux-amd64"
      sha256 "b8bef5e730da08af2e1b805b6752a27e636be2ae14e079a214eca3141e59cf00"
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
