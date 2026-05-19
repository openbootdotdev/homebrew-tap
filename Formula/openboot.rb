class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.58.5"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.5/openboot-darwin-arm64"
    sha256 "821b52aa85e54f0d6ec2a1446a83bd9ef3e0f64a37ead963f4c5727f18965475"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.5/openboot-darwin-amd64"
    sha256 "2ed5529354fcf7cb371056c730217fe23afdad3a646d71dbc827dc6a4d9ba70e"
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
