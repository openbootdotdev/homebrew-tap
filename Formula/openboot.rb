class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.22.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.22.0/openboot-darwin-arm64"
    sha256 "3b73759dad1d7ef59804bb5f1b4fb2adc14740730622daa9f6b8bc7c4148eeb5"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.22.0/openboot-darwin-amd64"
    sha256 "b71aaa9a220dc7042fa0375daf38319e180a2a08c55bd1da0d1b0fcc1db9874c"
  end

  def install
    bin.install "openboot-darwin-#{Hardware::CPU.arch}" => "openboot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openboot version")
  end
end
