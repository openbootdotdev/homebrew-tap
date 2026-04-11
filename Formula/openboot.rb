class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.52.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.52.0/openboot-darwin-arm64"
    sha256 "ff0c31dfd35a0c93a30f1807838b47d61ccfa2035db2d145a11bd0cdc5dffc11"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.52.0/openboot-darwin-amd64"
    sha256 "67d73e95e5acb5ef51d7f3e2c95670b9b0f72a0c84d57d7a778d92242437d258"
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
