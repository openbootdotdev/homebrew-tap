class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.36.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.36.0/openboot-darwin-arm64"
    sha256 "2a8500a4a58580104de638211d31917fa73efc42c9bd471cf490d6b69a51d776"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.36.0/openboot-darwin-amd64"
    sha256 "05ce04b0b4f6a14ee972534278f3ee0414fa6b61d9cc1529ea9fc7ee85358a53"
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
