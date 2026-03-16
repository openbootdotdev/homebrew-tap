class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.38.2"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.38.2/openboot-darwin-arm64"
    sha256 "63a4c04f8d360ef980bb8f4fc3c31e67d90c2709275ed55f94ec54d6b8ffc5c6"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.38.2/openboot-darwin-amd64"
    sha256 "61fa4de5c47e47c1a87d4e876fdadc4064aff24eb2ea7d92872ce2ffff1a3ffa"
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
