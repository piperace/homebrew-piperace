class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.9"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.9/piperace-darwin-arm64"
      sha256 "ff294e7e70e176e4a9c5dbe94f4a52070bf2bf70d90cb6a5ae857540cbc65432"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.9/piperace-darwin-amd64"
      sha256 "95ebf7a3219839896879e57d0b02033bbd82a639c6625bb5a9aba233e7606e11"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.9/piperace-linux-arm64"
      sha256 "f358f01de1eada2d1e84cc618757dd67e39a6c2f32164b3b3040ec370547c2ed"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.9/piperace-linux-amd64"
      sha256 "5cca932b3b9e0ebd9804737c590ca625bf110303da44112b349aa10a1c50363f"
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
