class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.12"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.12/openboot-darwin-arm64"
    sha256 "39bbc6271d5b0e3a3cf77b32c3c53f6bb18608359fc9646d42fb459abb8c0011"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.12/openboot-darwin-amd64"
    sha256 "f50a379f7897b144d5f01f4eba152101c90a3f4d90fd0b683d1534cadc429e2a"
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
