class Piperace < Formula
  desc "Expose local ports through a Piperace tunnel"
  homepage "https://piperace.com"
  version "1.7.11"

  on_macos do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.11/piperace-darwin-arm64"
      sha256 "6b35f3d34762065482c46f83d618885c2d9823ceafb0f4af8be79787489492b3"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.11/piperace-darwin-amd64"
      sha256 "3354853bffbdc4aa524231d76be208448f686eed38da88922ca32e584ecafe65"
    end
  end

  on_linux do
    on_arm do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.11/piperace-linux-arm64"
      sha256 "f38dc4fdfce2d6fe4d3379a3f46db0bda12f47b4e72f77af2941cabf72dd7312"
    end
    on_intel do
      url "https://piperace-downloads.s3.us-east-1.amazonaws.com/1.7.11/piperace-linux-amd64"
      sha256 "49fdf277121a8905db296ff2bb7b5b7cd0be39f9130d7dcb410c34e681b2899d"
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
