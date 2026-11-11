class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.8"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.8/piperace-darwin-arm64"
      sha256 "5688243de32d209f6694b21d8834a9ca2f980fae1d008760ca16d3fb63a86ce4"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.8/piperace-darwin-amd64"
      sha256 "a58ec71e70b4dce29e0e851f1e08d09519d84e40479aca2489dac7f375926d6a"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.8/piperace-linux-arm64"
      sha256 "f5af35c4f6f92f454c00cf388b162422e07eb0bf2c12d3c9918a00f02c3c3879"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.8/piperace-linux-amd64"
      sha256 "a6befccf15d6e4bc728193f3c052966d5206290a62c74c675e369d424b4ee553"
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
