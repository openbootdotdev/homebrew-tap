class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.66.4"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.66.4/openboot-darwin-arm64"
    sha256 "79048b8e84cd962e89f7f2e5dfc57e1e3720039df05cf2e01a0062836792bf4b"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.66.4/openboot-darwin-amd64"
    sha256 "af3521f061ed06d0028f11db12101bfbf1b411c2980ce2f4dee42657240435ff"
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
