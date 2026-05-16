class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.56.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.56.0/openboot-darwin-arm64"
    sha256 "95b2015e147f9c231e9eaf3b1d3d4bb5baba722a2ac815aaa53277cd19895371"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.56.0/openboot-darwin-amd64"
    sha256 "7fb8e068acd7dfb8d6eb302a53a5f132ebaae08ff9a66f85106c67c82b939989"
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
