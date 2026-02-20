class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.29.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.29.0/openboot-darwin-arm64"
    sha256 "a26dfcbff00e757ba8e2455d8a4a33c646bf286ba28bff474b75b7020e642598"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.29.0/openboot-darwin-amd64"
    sha256 "4afcba55260784dcfc5786249091136badedd7b62a2a39e65cfc3b9d99b4d0c7"
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
