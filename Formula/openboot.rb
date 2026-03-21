class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.11"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.11/openboot-darwin-arm64"
    sha256 "5bcacfba5d434caf1d5b05bbc1093009fe142640a2a7f51a2aeaf3ffdd0b2268"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.11/openboot-darwin-amd64"
    sha256 "aff533c7871b812bdae3cde7bd4e975fdbd9cc62452af02c4213fb98aa467e64"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "openboot-darwin-arm64" => "openboot"
    else
      bin.install "openboot-darwin-amd64" => "openboot"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openboot version")
  end
end
