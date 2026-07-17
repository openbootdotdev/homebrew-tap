class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.65.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.65.1/openboot-darwin-arm64"
    sha256 "d4cdcc553a51d7813333698872fbb0ea90fc13d87e70c75f11c624425e57f504"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.65.1/openboot-darwin-amd64"
    sha256 "1bc3e44aa8117372e982d16c5837172093c8869262c611aa01d7e6b20394b156"
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
