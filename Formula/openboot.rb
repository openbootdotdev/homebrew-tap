class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.23.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.23.0/openboot-darwin-arm64"
    sha256 "7187019d1c3f928362b345cf8c806f14387ead73430d48507b1e36d232223ddc"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.23.0/openboot-darwin-amd64"
    sha256 "a5679ace7841efb1a83c81df8baa413d8d05ef91beff855c55cef93da7bc649e"
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
