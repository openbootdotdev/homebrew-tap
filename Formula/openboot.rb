class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.66.2"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.66.2/openboot-darwin-arm64"
    sha256 "d5f6cfbc0cf5fce2930971a587c0aa521b46696edf1f91d43a9fc119f3b36326"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.66.2/openboot-darwin-amd64"
    sha256 "af64afbdab6dd5f313830d48546c7c8060ce14e2a9b243f60500e9455ee257c5"
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
