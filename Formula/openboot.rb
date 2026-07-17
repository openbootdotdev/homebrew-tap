class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.66.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.66.0/openboot-darwin-arm64"
    sha256 "de0c8914ed75fc0f9a3020e235824f2d786f827db4b70053ac5ae2f7eab928e2"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.66.0/openboot-darwin-amd64"
    sha256 "95df812efc0e31ea0426b2739961b77fc6d79d1f7e7b26aa0ceac5ca43063cc6"
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
