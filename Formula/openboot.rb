class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.30.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.30.0/openboot-darwin-arm64"
    sha256 "e82da938c8faffe8f1020a481b083d495367eaf7b73757fa98874de87ae43291"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.30.0/openboot-darwin-amd64"
    sha256 "631f4af4d94dfd8f4b9f3994533723b11c9665e9a124f88d65ebedd5b520253c"
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
