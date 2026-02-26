class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.31.4"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.31.4/openboot-darwin-arm64"
    sha256 "9e3014a1d507973c55a33563dc2a39d08e68abc23c8642af4f9d98d956505800"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.31.4/openboot-darwin-amd64"
    sha256 "2b4b6c8b52bd01c079c22ab942a48d524e4bada4e735b751c88552ec5a33fe98"
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
