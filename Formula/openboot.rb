class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.37.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.37.0/openboot-darwin-arm64"
    sha256 "a73f924405c33bc748b79a8e9425e3ecde1bc7a420e031b789a6294d3b1d12a1"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.37.0/openboot-darwin-amd64"
    sha256 "553f0a5b1bcc3aaf944ea166231b1ed4a0e6d163157ba292320e25b6a64c3726"
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
