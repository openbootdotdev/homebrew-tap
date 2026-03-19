class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.42.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.42.0/openboot-darwin-arm64"
    sha256 "b6553325467b535dac8a3a2b1953ab3c3f2e349c21366ad8babc9f60f04942f6"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.42.0/openboot-darwin-amd64"
    sha256 "fecf8e7b70f57db1d8457049e082fdf43c9276a7c5bdca9eda0e7a4ac1dee2bf"
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
