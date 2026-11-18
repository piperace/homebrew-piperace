class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.17"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.17/piperace-darwin-arm64"
      sha256 "16046e74a65be3d2f942d6371c3646a9f3762d43035303b033451accd16dc698"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.17/piperace-darwin-amd64"
      sha256 "9cfafc75e4d54c792e671b0fe17b1b97ccbad92ece5ff4a79ff3e0a31b499740"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.17/piperace-linux-arm64"
      sha256 "ee052ee84410d4ef1a99fb9b1ac3b94277e8ded2f34556171756f2f3cbab9a3e"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.17/piperace-linux-amd64"
      sha256 "61374f7ff8bd3442d933db7a68e97f3a78c3fdc1b9e83f3f37aaaaec1f24a70c"
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
