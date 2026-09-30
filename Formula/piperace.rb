class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.5.30"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.30/piperace-darwin-arm64"
      sha256 "17fce44895ec10a2e779f93131ead4d000a8f1e88a9e1e6ab84966acf7f654c9"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.30/piperace-darwin-amd64"
      sha256 "3a6798fbc0b456c324d7c52e1c036d0386a03bcf77c8337d83abdb0f9c7ef2ad"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.30/piperace-linux-arm64"
      sha256 "afbb0a5240911e4451610420c063e5bd8dc9534aa80b1c33c4bd36b19b5b53bb"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.30/piperace-linux-amd64"
      sha256 "a80dde919afea5fa8f0b8dbbc3631d23cfc51d29457e2ca634137a30755b6b05"
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
