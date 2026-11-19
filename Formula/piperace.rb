class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.18"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.18/piperace-darwin-arm64"
      sha256 "7d18fc0ac01abd825e8baccf47d6863d44a722217e4647e56826699c142549f1"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.18/piperace-darwin-amd64"
      sha256 "0b03d9d358c8aa329c3a8fbbac99eddd2c686eb2e4c7e1a3c719935168b145af"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.18/piperace-linux-arm64"
      sha256 "bd27d1c1eecce0ff3596525de504bcc27fdcaad1635b2ff3a342917cb56c6dc7"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.18/piperace-linux-amd64"
      sha256 "418419a13b328354cde6bdabd716402bf267a7a080461473fd1035ddcfe63085"
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
