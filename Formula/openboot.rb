class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.8/openboot-darwin-arm64"
    sha256 "0949b775fcce62128b4a0e625087e160dcbcc9c80402e1bd12f51387863a40cb"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.8/openboot-darwin-amd64"
    sha256 "06584a472a272438f1aa425c288c65453b86ac22199807b2c40bcb3a2d6ee5d5"
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
