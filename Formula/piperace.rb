class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.13"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.13/piperace-darwin-arm64"
      sha256 "5388203bd92ab9912a64d793144df699bb9f137d17586cb25eae968e7760634b"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.13/piperace-darwin-amd64"
      sha256 "a8179cf1aba7a14a3acac5af646a83f022037daff1e0548363f20186a8811b92"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.13/piperace-linux-arm64"
      sha256 "af0cd0057184e202fafb53be1bd98ceed818322595ffb35500c6926be2afaf1b"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.13/piperace-linux-amd64"
      sha256 "dbf469dad58eacbfe9c0b6418450b4811b990aeb281ebdc7e5fb3f21646b46e3"
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
