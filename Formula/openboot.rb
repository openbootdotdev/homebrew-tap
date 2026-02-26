class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.31.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.31.0/openboot-darwin-arm64"
    sha256 "c31db9aeb6c0f02896278628ec899a1c6c5ffb815d7a9ca38395bb75282baf84"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.31.0/openboot-darwin-amd64"
    sha256 "9f23511b2eda4c9692dd4ed651cf1457446cdd3c28d3d51a274427690ca89b1a"
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
