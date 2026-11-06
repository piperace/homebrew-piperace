class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.5"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.5/piperace-darwin-arm64"
      sha256 "43c7ee7753c34dc57925d84141283d2f69d206288aa743e2a1d71d53a4078f14"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.5/piperace-darwin-amd64"
      sha256 "f9af488b832c6298666e51a80a592181694b79ec45086b90bbad73ed85fc9895"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.5/piperace-linux-arm64"
      sha256 "6f2212519e4f99f630e88a4bd443527c95bc34d1f4a482dd524ce6fabb7308a3"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.5/piperace-linux-amd64"
      sha256 "4cbeba756ca9f96a4a43e6f95955d8b191a0cbfafa61d95b00444363b46ae8f4"
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
