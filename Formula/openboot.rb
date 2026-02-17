class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.28.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.28.1/openboot-darwin-arm64"
    sha256 "8c5e608067ba172b6520c66eb2b47b95473da0bf770a5613638cbca392a2e7e9"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.28.1/openboot-darwin-amd64"
    sha256 "40f069ac0365f7a0b0994bd05ba7036b5a01f774805e3601a101bead07f25387"
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
