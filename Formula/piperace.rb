class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.5.33"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.33/piperace-darwin-arm64"
      sha256 "c5032f1e85bcc681e0dbde4272c72c9a4d8f0f86eafef309d4ae7b4b0ff58f50"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.33/piperace-darwin-amd64"
      sha256 "13ed70a58c2d11d3628b21a8fc75c926131f53f6df58f482e9747adab8cda7a4"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.33/piperace-linux-arm64"
      sha256 "e72ead0317fc130be21c841bc5f37042e086040d42ae645ed7c98faf43ab7d9f"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.33/piperace-linux-amd64"
      sha256 "cf6c5609c29ab65bfa1b9b4abd22e4374621e90022c0d0bda23a479ca4dac2bd"
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
