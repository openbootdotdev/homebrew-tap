class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.26.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.26.0/openboot-darwin-arm64"
    sha256 "3f453403d7c1def6af63c0b1bcf96c62701106f1ed0aa764f8cf30e17cc26fe9"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.26.0/openboot-darwin-amd64"
    sha256 "20f4c0308b11775670298ad6a4357e52602341dbde314f6da5db431021344747"
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
