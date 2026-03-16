class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.38.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.38.0/openboot-darwin-arm64"
    sha256 "400c8d10a9dbe5f95ca96b29e6804952221258315b158a6927c4285efbd4d719"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.38.0/openboot-darwin-amd64"
    sha256 "4dd04615c3f5cf9703b6894ae14f23824aae817d42d855b3778b360194046508"
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
