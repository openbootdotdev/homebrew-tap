class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.58.6"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.6/openboot-darwin-arm64"
    sha256 "d7875970f8c94f6609ef5e2928dd885435afd320083d2a113c0b56e24b917d70"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.6/openboot-darwin-amd64"
    sha256 "977ba5062069d3056800865ccde16efa68a1bd59db5dd47426b076e174aeeb46"
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
