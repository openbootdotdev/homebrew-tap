class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.6"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.6/openboot-darwin-arm64"
    sha256 "800da5e090b03386ad9b99a024e5c689be2b997411352f31c3f54c59bc4f3442"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.6/openboot-darwin-amd64"
    sha256 "af37348951446803bbb13af86893d47abf2001fd73c2cd70dd3641571a61682c"
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
