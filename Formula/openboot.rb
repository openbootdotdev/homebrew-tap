class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.46.2"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.46.2/openboot-darwin-arm64"
    sha256 "f69b3e998d66ff56cbf14913a3c762f3cb2e4c39c8a08811a2a8edf6a6cc8ca0"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.46.2/openboot-darwin-amd64"
    sha256 "87e43ec5d17d43f037695286e168615f57ed639d4750ee46292db1f2528ceaee"
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
