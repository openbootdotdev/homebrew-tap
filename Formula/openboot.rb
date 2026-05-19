class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.58.8"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.8/openboot-darwin-arm64"
    sha256 "70f9d4a80b8afe1a700aa9697d62b8037738668614ed2abd84c6e7e8314b1365"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.8/openboot-darwin-amd64"
    sha256 "759d7586ae5364377c87acbebab5b32e00797ed401115af2428a5311b8703219"
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
