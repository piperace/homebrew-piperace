class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.0"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.0/piperace-darwin-arm64"
      sha256 "0910a32ae092852d3c024dc294a9f9ff96bf5a67a8bfea1226fc0fe274e8c6e5"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.0/piperace-darwin-amd64"
      sha256 "c7c7d367c78982a05ef3116a2b77b5d63f34812e0ff1d857b8c82f12c3c4638c"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.0/piperace-linux-arm64"
      sha256 "2521c25edc848b7f5cfa1ccb61e13a546490bb96dd01d95a92fd8e9926279475"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.0/piperace-linux-amd64"
      sha256 "4bbe687ae4e6518a944c31d14121a275988b3eec04aadc504a9b3786156a87d9"
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
