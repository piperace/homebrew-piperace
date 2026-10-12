class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.6.0"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.6.0/piperace-darwin-arm64"
      sha256 "0323fc2d1fd75c661585ba2dc630f70350ce96b8289e0ceab34191a8622cd048"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.6.0/piperace-darwin-amd64"
      sha256 "35246a2412341478a618cef6260e713bf5b237d082e2cbf2217a2d8d1cc5b746"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.6.0/piperace-linux-arm64"
      sha256 "9344d8d71f4c0374866fe3c41e4ec5389615188c5bb71780eb7cd275c5757060"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.6.0/piperace-linux-amd64"
      sha256 "3d064dde076e0221364a17116d66151612a452d4fa09c3672ec4f7c182486185"
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
