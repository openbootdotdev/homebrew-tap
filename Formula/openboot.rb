class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.3"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.3/openboot-darwin-arm64"
    sha256 "e50c3f947104e4337ae670ba6977dab57129ce7c930483d36ac8f3dbfa59f768"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.3/openboot-darwin-amd64"
    sha256 "8eb14da8a1ff45e9a37b2d9058e64ae50952e49de2a6d799fd7c093a1bd5dcad"
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
