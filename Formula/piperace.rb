class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.6"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.6/piperace-darwin-arm64"
      sha256 "6137fc020684231ba3afed9fe0b26a480fd5a880033b87995188882e12c1e364"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.6/piperace-darwin-amd64"
      sha256 "628ff4fc652945cc9a7b2adb04c6762786848b38e890ce5d05faaf9ea52f425d"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.6/piperace-linux-arm64"
      sha256 "68c8a6ba2b4728725b16aa4c987ff1edfaf6ab2f7bbdce80cd18843d36b7c5c2"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.6/piperace-linux-amd64"
      sha256 "cd21a0fce838e198304b101203701f553dfa538abac96359f7f0a7fac0d5d32d"
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
