class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.34.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.34.1/openboot-darwin-arm64"
    sha256 "89dd38c67eb8b187910fbd573c809056766b4f87acb9671372b8bb7a974033dc"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.34.1/openboot-darwin-amd64"
    sha256 "f2ca776be2717b764a2881d7f9f279227a0915642e4d2102e5e1d44f673620d2"
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
