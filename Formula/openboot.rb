class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.22.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.22.0/openboot-darwin-arm64"
    sha256 "e963d98018c634f7d0189cc89adeea761a80e0e55c8379372fdd7291ed11e0e9"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.22.0/openboot-darwin-amd64"
    sha256 "8fbc084cbd453499866c71a695b6d52851c281d3a971f2f9815335e6ceacda21"
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
