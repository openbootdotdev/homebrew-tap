class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.31.5"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.31.5/openboot-darwin-arm64"
    sha256 "f36506f628321b53776ef54a45289f89099e490d348b8ceee493b307aab91d02"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.31.5/openboot-darwin-amd64"
    sha256 "aacb0ce4b8db0b90578b50f36b65c0c8f03a02602123c65da9e0a9ff3f666625"
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
