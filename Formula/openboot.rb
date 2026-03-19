class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.43.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.43.0/openboot-darwin-arm64"
    sha256 "19294d19f9a2eb5e79c35e5525b999da1c8c5c7c9772aaed7114f03e27cd86b0"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.43.0/openboot-darwin-amd64"
    sha256 "7603c2a3fe7d49b15bc914642b78581706c0bff5610e9612b5209b2b054d8d9b"
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
