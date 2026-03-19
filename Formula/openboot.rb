class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.0/openboot-darwin-arm64"
    sha256 "bee3de231afe492ed9aeadc7f8c8fdca41fba7a3420b89fd1eb7c6f7d25889ea"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.0/openboot-darwin-amd64"
    sha256 "4b3625b997c8b1d563f99961cb464b69f5dbb5da5e3e9b8084468c268e0bdf6d"
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
