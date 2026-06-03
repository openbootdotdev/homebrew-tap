class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.61.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.61.0/openboot-darwin-arm64"
    sha256 "e860e8135fa06103c3e3ca3ba4d1e01f2eaf1a8a7dd8667e8368c90aac41211e"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.61.0/openboot-darwin-amd64"
    sha256 "db4ed6342830bbfb8a8348f5d0fa6b7fc24b3e9bff63d7dcfc74672f9205ad09"
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
