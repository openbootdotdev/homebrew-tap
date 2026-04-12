class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.53.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.53.0/openboot-darwin-arm64"
    sha256 "c30956b3b7612709d9c0734ca9345bad0526715d5dd88ea3995dcf3f48a55aaa"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.53.0/openboot-darwin-amd64"
    sha256 "d814bdd2a95c531012f09e66efc575711a8e3d878221479914da81ce8faaa7da"
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
