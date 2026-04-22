class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.55.6"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.6/openboot-darwin-arm64"
    sha256 "1ef062a5a2763fbed3eb61a6a4a5ef3945fade8d3745d09f363b4bb4c0e29c8f"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.6/openboot-darwin-amd64"
    sha256 "92c0634bedd8122caa245275c89325dd8f6ab3fba609bdadc3562e46c1472f7d"
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
