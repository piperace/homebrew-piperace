class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.4"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.4/piperace-darwin-arm64"
      sha256 "172fab87cbffba40ad9282e25530fa01ca5ebc00ba31508eb53256da35953ca3"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.4/piperace-darwin-amd64"
      sha256 "caefbfef90855ff4414e56f7c3aef5cd2694236c462c18a1b76456aaf7d1dca6"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.4/piperace-linux-arm64"
      sha256 "90c385b4f7d9664aef817620d692ffb1e948ae6871a9538cdfd5ff27558420d7"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.4/piperace-linux-amd64"
      sha256 "47af98dd92ebf16a75f78b128a930b6250b84839860e851598717545724a0218"
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
