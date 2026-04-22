class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.55.3"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.3/openboot-darwin-arm64"
    sha256 "88b10e1183478c2c5f398e66b660febd2b53775d047b67b049fd2d8544633d75"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.3/openboot-darwin-amd64"
    sha256 "a2db81ae62f64037e3a50e835e86fd7516b85e48fe11d1e47077588d7bb8f2a3"
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
