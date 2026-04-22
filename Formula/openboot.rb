class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.55.5"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.5/openboot-darwin-arm64"
    sha256 "eeced3d409a31b4397d6f85d824d37d1a5a0df685b91bc77e2b7bdf512e24efe"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.5/openboot-darwin-amd64"
    sha256 "cc1edea1239c25150f1919b3bd1ad23d498aee810bc98a0d3b6c72c90e1edf88"
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
