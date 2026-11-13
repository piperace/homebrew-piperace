class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.12"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.12/piperace-darwin-arm64"
      sha256 "1c8a79f9e00f08ea19e1eebb926c21a0b1594eacb4cf1e6d0be582b5e29dacea"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.12/piperace-darwin-amd64"
      sha256 "cba7de0beb2c2bbcf77e2c3eee3bd359f3265140eaf221558d6f2f6fdd1bfeaf"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.12/piperace-linux-arm64"
      sha256 "4525c37fa1aa59553eaaacb3640ded38f0326389ed20035de826fb01eed24a11"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.12/piperace-linux-amd64"
      sha256 "622d66c5017311ea16bfd0e29ce56dcb6d22a0409da700e2d4a348305cd9f3d3"
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
