class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.39.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.39.0/openboot-darwin-arm64"
    sha256 "3c190667b36027d21f933b2e09143bd78f0c9a26e8b087108d9b961f465cb92a"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.39.0/openboot-darwin-amd64"
    sha256 "8e5ff8bdbfdf856b2ef3cd3f33534d4cd1cedc77476e061db7a9925a85971556"
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
