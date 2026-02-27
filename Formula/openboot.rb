class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.33.2"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.33.2/openboot-darwin-arm64"
    sha256 "6e1a2ed0e7c094b696b52028aab44c5242b78df617baba4716ddea81cbf3e209"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.33.2/openboot-darwin-amd64"
    sha256 "29b6d841d990b2fca9762a6ee3db841ec16da1c79fc266733052befb7fdf841c"
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
