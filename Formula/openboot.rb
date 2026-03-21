class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.13"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.13/openboot-darwin-arm64"
    sha256 "bd04301eaf171d91c52339bc5ba50f52842d18be440022d61ade46218515a5ba"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.13/openboot-darwin-amd64"
    sha256 "7c95bf835fcc9697fdbb03a41f0c45fc62e4d881c6ae404e080de1f214abac97"
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
