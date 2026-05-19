class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.58.3"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.3/openboot-darwin-arm64"
    sha256 "a309f126c1165471d4146885c87c2963f7ca76c405abbde61b2ae36778a32045"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.3/openboot-darwin-amd64"
    sha256 "7483fe700ce7a10a82e1d2ea578445ae2f33a4771d69db1ebb0e7cac7d73181e"
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
