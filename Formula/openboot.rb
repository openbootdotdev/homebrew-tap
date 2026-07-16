class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.65.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.65.0/openboot-darwin-arm64"
    sha256 "b57956a58d9652077fcf490afabfebbf663df441d7fde775f398befe9b8b10a2"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.65.0/openboot-darwin-amd64"
    sha256 "fcae74dd3ccba038c7cdc6be8a6c12b1e77f9a1758447d6f5faf85b1ab7bd0de"
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
