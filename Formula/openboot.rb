class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.51.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.51.0/openboot-darwin-arm64"
    sha256 "42e24288a0651ed7d522738185a78ce793d71724b79f33ecfe3c8645398d328e"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.51.0/openboot-darwin-amd64"
    sha256 "39d316f4c1696bae76b3c92433444e7a57c91180187a8c00071e966ef48c7380"
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
