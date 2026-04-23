class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.55.7"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.7/openboot-darwin-arm64"
    sha256 "bfcd8acfb6aa1069291a945424d58f4961fdd866d177d41a0f5fd37a365a7e1b"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.7/openboot-darwin-amd64"
    sha256 "1222b3b1f237b9f83957fd3c4fec3cc9abdea3bde3960dd6bdc69a90f0ac2209"
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
