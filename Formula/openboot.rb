class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.58.9"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.9/openboot-darwin-arm64"
    sha256 "d9f84aa4222377af2197b0c143208efa3ede0bdb1ec7e1c2f8a53a7175a5d5a6"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.9/openboot-darwin-amd64"
    sha256 "6ed4b15bf6a0c7dc38c46fe8cfc755d655f892ead77eeb95ebc70d28dc2f7821"
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
