class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.5.26"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.26/piperace-darwin-arm64"
      sha256 "848964cc23b1bd246b7e38cd9ba3d03e31e52c62d6ce42a43e96d6e205effe08"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.26/piperace-darwin-amd64"
      sha256 "681abf7e0b3a708858c8d741d3716c90495ec5698725ebf5734cd01c5b68d103"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.26/piperace-linux-arm64"
      sha256 "21665f137aa5578cb9f706ffd56c7b423331f23bfc6f16692306063d928bf840"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.26/piperace-linux-amd64"
      sha256 "fb8143cbbf415955d375351b7d33e2136401ce9ea35c89ae0f71e9a8876b6fb6"
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
