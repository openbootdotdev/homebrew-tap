class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.66.5"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.66.5/openboot-darwin-arm64"
    sha256 "5bfb3f2cbb35d29b2ab3fe7cc7e0abe75cf185eb1b1796f138c8b46755793a37"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.66.5/openboot-darwin-amd64"
    sha256 "0a35b09b5196b7b33ffa1dc5630b9c4087dd153d00ce4f7712140b106a423901"
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
