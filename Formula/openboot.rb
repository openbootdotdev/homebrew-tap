class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.55.8"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.8/openboot-darwin-arm64"
    sha256 "5c04c83958dd8649e712c489815fd8c13973aed40c96f6dd7fbabe954e7e3b9d"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.8/openboot-darwin-amd64"
    sha256 "d9d9f3e90a67f195c95c177e40d1fa9ff0f72bc6e005a10c3a3ab04a6f0f04c9"
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
