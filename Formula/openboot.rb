class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "1.0.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.0/openboot-darwin-arm64"
    sha256 "1242a56f3eff559711116443517d2d3c46ef69b9f7ad7c8d42fda4329f9801aa"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.0/openboot-darwin-amd64"
    sha256 "c9a4ba4c18eefd8b3e4d87c32a7d9b01d0eaf9b0fa0505b88871978496815839"
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
