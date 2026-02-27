class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.33.3"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.33.3/openboot-darwin-arm64"
    sha256 "88567a7678d99220ffcaabf4a41c523efe5b648f90c04acfa238ea77d645e8a3"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.33.3/openboot-darwin-amd64"
    sha256 "a91582de81a9af2b866101fa22c8bb67beb6749993059986e5a850fd484c4502"
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
