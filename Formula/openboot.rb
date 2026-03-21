class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.46.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.46.1/openboot-darwin-arm64"
    sha256 "7bdb0252a38c464250504f7d72e2454e90338c98ded12d4009e802a25cdba3de"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.46.1/openboot-darwin-amd64"
    sha256 "d78f4328cd6303d9fa5e57e00e03033def1debf40cb207bf79b1bfd8846a18b8"
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
