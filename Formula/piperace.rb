class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.1"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.1/piperace-darwin-arm64"
      sha256 "b3727f8352686ff1edd12d1b556b4a2461530e5c327b0a4cf79c2b411e0e3f4f"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.1/piperace-darwin-amd64"
      sha256 "ecb11b7df9454c68ed33329779054b84fd975308e501bf09f48d3ab9802bbd22"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.1/piperace-linux-arm64"
      sha256 "c574fdd3cbbf333da72b0293d7d0d580c26b302f228869acceb5e313817aa56e"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.1/piperace-linux-amd64"
      sha256 "2564ded438239f71b4145abc3121a5720a0935b54bf79c8455b5a012c3e531b6"
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
