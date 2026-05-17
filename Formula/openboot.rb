class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.58.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.0/openboot-darwin-arm64"
    sha256 "eeaa44eb13e9955b4b9cd04b6b6c42f52c6e5eb5cd6ea879947e924e7f197185"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.0/openboot-darwin-amd64"
    sha256 "efc32a2f8d2dbb1c7b816d86d6b4f0f89bf164d3c55fd9b7fb45189f68642d98"
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
