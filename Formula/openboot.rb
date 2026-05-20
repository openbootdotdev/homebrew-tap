class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.58.10"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.10/openboot-darwin-arm64"
    sha256 "6477ee5106e82f292c5b199ba5b9fcd89bd7eb9b16d574beba5f599c4d5245e9"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.10/openboot-darwin-amd64"
    sha256 "e6aff4d6c2db0370ebe45d17e4139feeb1067a156385e76625205d6a3f0c135a"
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
