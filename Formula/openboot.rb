class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "1.0.5"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.5/openboot-darwin-arm64"
    sha256 "585b780fd33de41743ef6442be4eeb77cb2c618954b2b5c6bf8184fd5b07155d"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.5/openboot-darwin-amd64"
    sha256 "225e10186333c88e5bc3f87b5457395db8c6a65952f3b4d2c1de67fa38845ed3"
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
