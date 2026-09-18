class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.5.24"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.24/piperace-darwin-arm64"
      sha256 "ffbccbe329916ed12d7916bf8c825eab87f3af9dced72f25c55de54b273aea52"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.24/piperace-darwin-amd64"
      sha256 "6996bbda24e079e25c239e409c55d8706faa155047cfaa146c902e0c3d086efb"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.24/piperace-linux-arm64"
      sha256 "ce738c42c01fe544c392778c5df7c28a02b3f570159dc3b1d72f6c48e3e71f60"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.24/piperace-linux-amd64"
      sha256 "f3b39254daea2de64cbfc468c1627b8624b65c515d536c9aa7d84d043b05e2d0"
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
