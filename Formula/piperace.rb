class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.5.34"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.34/piperace-darwin-arm64"
      sha256 "e4b5935564901ea4fb95522f52b5b015414a0204e4eee643fb056231aba25d0d"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.34/piperace-darwin-amd64"
      sha256 "e68fa766158fe05ce4262d1a138c30213830a77ab0715ce14fdcd285d636e84a"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.34/piperace-linux-arm64"
      sha256 "872c6ce59fa790f45878af7843a87fdd0f77a9012499762879dd9bd64a402552"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.34/piperace-linux-amd64"
      sha256 "1efd77cedd6c9d532444e1a163fc6903dcffb3449c07afbc12b721bd28136f33"
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
