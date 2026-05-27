class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.58.15"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.15/openboot-darwin-arm64"
    sha256 "e4f139624758de618a456a7cd9835fdec8c1d673398ef729d81e36b31862728c"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.15/openboot-darwin-amd64"
    sha256 "f74ca8cafad5ba8e9a9551eccf7292ec167071771b151db68fd6133a701bda20"
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
