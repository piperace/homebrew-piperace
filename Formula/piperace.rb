class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.5.31"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.31/piperace-darwin-arm64"
      sha256 "4a95164406d29d11d37b0a93781f03b5c87f320218776b227ea3d8382adbbe34"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.31/piperace-darwin-amd64"
      sha256 "1e658fe0e4930a6ab5d1e8d60b89893b3644e642164e0195f20e35fda433fe36"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.31/piperace-linux-arm64"
      sha256 "5e2efa934c49e3a2316583a5f712dc4a7a31cd4d899d526cda088ded4e18102d"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.31/piperace-linux-amd64"
      sha256 "675d16cdfb162a223c9ebbcfeb0338fb1b01dd88b86c685db6cbd8d798085709"
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
