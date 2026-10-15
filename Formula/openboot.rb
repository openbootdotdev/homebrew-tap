class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "1.0.4"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.4/openboot-darwin-arm64"
    sha256 "b0ce86bebebcb530955e33080bb098a85b16798011ffde2edd4af54fcca2b3a0"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.4/openboot-darwin-amd64"
    sha256 "13a509f967d8888479bb49a42253241b10fa68581b5f92b587f5f002d55f523c"
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
