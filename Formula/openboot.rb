class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.31.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.31.1/openboot-darwin-arm64"
    sha256 "5b99235241fee8e7e4dd651d37dc198a897ec146f0a7d3cbfb2d5de10aa28751"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.31.1/openboot-darwin-amd64"
    sha256 "58b343c93ae996381e564103b5d20be025ce4a780a30bf43f68d0fc0a42e3e4e"
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
