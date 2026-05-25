class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.58.12"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.12/openboot-darwin-arm64"
    sha256 "1f6eb4d3f3467bdc99a2399a54f0f727ed26a64a8db8c1d7e76a0b3c89dc790d"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.12/openboot-darwin-amd64"
    sha256 "543d416f19843fb084e7481c167864610c619ef0d2791a3d42c9389b43af7a5e"
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
