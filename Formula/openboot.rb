class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.46.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.46.0/openboot-darwin-arm64"
    sha256 "e5eb507e9bdbddd2d134845bb760b8a5d2b3e79434690a5283293c952dc7ce7b"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.46.0/openboot-darwin-amd64"
    sha256 "461c0ad021d64879fdf1ef75de8358eca86e1244d875438ff76c98e51923c9f0"
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
