class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.63.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.63.0/openboot-darwin-arm64"
    sha256 "76f34091283d83a7313f20da04b98cee9b42fd3d9f36e296a27c51286a661268"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.63.0/openboot-darwin-amd64"
    sha256 "e89ac3c885acc3636355a67d79a5021749a4f474e9832efebadfd1e22fa072ba"
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
