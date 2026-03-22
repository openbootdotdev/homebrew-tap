class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.47.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.47.0/openboot-darwin-arm64"
    sha256 "1726aed1e55c4a01a23e3ba747bae8794d85c16a3aebe67424115150d65b39dc"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.47.0/openboot-darwin-amd64"
    sha256 "a6cbddc81cfa13a901ca6bdd1fa111f563d57caa2f121693c39c87642c5e792d"
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
