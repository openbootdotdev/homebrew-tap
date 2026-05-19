class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.58.7"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.7/openboot-darwin-arm64"
    sha256 "fc70afaeac90e2bbaa4c3bddb97f7d92cc08eec7bb37958eee60b4f623521c26"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.7/openboot-darwin-amd64"
    sha256 "6c48a37c5cdc2279f66b047b5ad99ec39fbedea58ebed4be5d3fc53977abf77e"
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
