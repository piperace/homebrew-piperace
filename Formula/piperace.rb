class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.7"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.7/piperace-darwin-arm64"
      sha256 "d098247fc511de7ab388e4b44221b15cf4154274e662edcfddc04ca3781389f5"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.7/piperace-darwin-amd64"
      sha256 "66924b000534fb93a382223b6cbbdaa077c64847da9637897ab95584c9d40f55"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.7/piperace-linux-arm64"
      sha256 "2e98636148d3d64858dd9137099f147344beb37a22c01b1dab0844abfce19a59"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.7/piperace-linux-amd64"
      sha256 "f1ec0dcc053be9d7d4027ce31b11040dd927131ddb96edc175e13bf76863f97f"
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
