class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.5.23"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.23/piperace-darwin-arm64"
      sha256 "59b61957e958c436a5325631c7425ddacdc6a3be08b838227bfd8b651b137b65"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.23/piperace-darwin-amd64"
      sha256 "754ac943b9b817aea337d33c5abf57ce8c1b1a9bab23cd60bf917ee797a8bd83"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.23/piperace-linux-arm64"
      sha256 "dd7bc0a5aaaeaa2ecc4b06c85a50854fa69461777f2a79af54a459292eeadf16"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.5.23/piperace-linux-amd64"
      sha256 "9773de071f192a42d3fc82e5f423e3e291197786b00556059ec95779b52cec04"
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
