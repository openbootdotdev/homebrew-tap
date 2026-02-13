class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.24.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.24.0/openboot-darwin-arm64"
    sha256 "680ed10e7cb951b29fe67fdb7e32ec95fcf01cc4719d0b9271743970fcffc9d9"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.24.0/openboot-darwin-amd64"
    sha256 "8605ed0bdf61cd304b7b9dd57644ecef73d0ff21133dc8c7badc41b9bc326dbb"
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
