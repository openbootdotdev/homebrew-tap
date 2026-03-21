class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.8"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.8/openboot-darwin-arm64"
    sha256 "c3e45630ef2fc0943c1595f68b436c3a93d12ad372012cc744a7497dc1b0e3ad"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.8/openboot-darwin-amd64"
    sha256 "3a8b0c608cfe7434ff2c3e2799b48df30259fc38e47b21fe2c36574a1c026956"
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
