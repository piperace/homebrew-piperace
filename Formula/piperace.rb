class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.5.25"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.25/piperace-darwin-arm64"
      sha256 "ab86755767cada0684e0e26af2d2edace5ce7eee6aab97928f2c28e5249df867"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.25/piperace-darwin-amd64"
      sha256 "deaecce3d5dda93cc36a7083f08144b53a80593cbf2d3fb60407b786e2e57c58"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.25/piperace-linux-arm64"
      sha256 "97be3efdd27a5d0b2870def6c9a656bdb7cf203ad7fc632305c30e83313607d2"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.25/piperace-linux-amd64"
      sha256 "60d5891b2d183c189f10b795113e2e1cfa19bc25827155b9d94789826243810e"
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
