class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.49.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.49.0/openboot-darwin-arm64"
    sha256 "7c4105f25bbe38e21b4fd7b91df7231248e412aa4961d6323fb4329083e9ded8"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.49.0/openboot-darwin-amd64"
    sha256 "bcfd181329502d7c0c10f183c4f403c3f73b7ec28dc9bca18cc1512149f217e2"
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
