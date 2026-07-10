class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.64.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.64.1/openboot-darwin-arm64"
    sha256 "dad33a5551d6508d9f7fe8c9bc9522974ae1d7db69113a40c097f437f334a81c"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.64.1/openboot-darwin-amd64"
    sha256 "796371c524e316f566b3c29eae5c14893e8132577f343ea189cca9f84c1aeafa"
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
