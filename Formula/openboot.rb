class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.57.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.57.0/openboot-darwin-arm64"
    sha256 "0034dab45097c28127969e994a9985143eddf2425b8a0a8a0d61ceb571d85471"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.57.0/openboot-darwin-amd64"
    sha256 "76254fdf6753f8da9da245079ff0c4d9bec0192b2ac0da08e433ac81d71f01ef"
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
