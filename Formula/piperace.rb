class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.5.32"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.32/piperace-darwin-arm64"
      sha256 "567a9baa3c623f3d5cee09235b46a45f2e7943fe107dfac237ff9952de0bd4b5"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.32/piperace-darwin-amd64"
      sha256 "3b8c06a34b1db6292216af5a85cd14df05832b94a22e25fa1d58724719d78ec3"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.32/piperace-linux-arm64"
      sha256 "31f50be0da11408f849ce159020297184a6b0f24c25cbf1ae824622e482777ac"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.32/piperace-linux-amd64"
      sha256 "d4cd2dbc78639cd128d4dbf927419b88bc775ca7dd5d6dbd14fb143cb8ccb11e"
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
