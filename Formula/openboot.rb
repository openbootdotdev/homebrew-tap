class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.1.19"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.1.19/openboot-darwin-arm64"
    sha256 "2190e6cc428e1366b53adcf3acf1ef47d0bd93bc765499309ac6140d0c709cbc"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.1.19/openboot-darwin-amd64"
    sha256 "546c8d2a248a2c19952d9cb5e8635836c720270e7aff992dfd2b1e9fef6aef27"
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
