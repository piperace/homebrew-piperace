class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.10"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.10/piperace-darwin-arm64"
      sha256 "7fee449918cf642ae778020c5bd50b64ce06a230a7a3f9ac249f03e8fa410904"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.10/piperace-darwin-amd64"
      sha256 "6ac48799795efad21c7bf3ea75842d138a08ca4688c503926c76db5096decac3"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.10/piperace-linux-arm64"
      sha256 "ae714449a2437a81c0d48d3b1b5b26f2eb68435943da6c4271f6c382c5353eba"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.10/piperace-linux-amd64"
      sha256 "6e0f354a185a0494c1c88cb394925ad083529ee52b619ba17c959f01b31b84a0"
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
