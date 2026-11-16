class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.16"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.16/piperace-darwin-arm64"
      sha256 "e5ec12aac8373223f31b4fef54afbc8e5065e7cf4b8d27684f2437181453c448"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.16/piperace-darwin-amd64"
      sha256 "87a9e09ab2b25d78419e0bdab63f8e92d88c0ee63b599a68a7bd875fab11934e"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.16/piperace-linux-arm64"
      sha256 "eb5a3d1b33e33d60d9fece4f0b4ac729fb1da653b4313b2868d8f46c23405795"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.16/piperace-linux-amd64"
      sha256 "0be60d710acad96975f3adcbebb8e45b4ddb635b1ea84e0106dc89c81ea70931"
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
