class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.58.2"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.2/openboot-darwin-arm64"
    sha256 "eca36f5b90d6e07335b12ffd7353604137518570650cad60710117e19e97c8a8"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.2/openboot-darwin-amd64"
    sha256 "4095fc9b0e9425f7422362a9b6570506461cac1922d8b926d13e5d116f740a19"
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
