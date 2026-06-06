class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.62.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.62.0/openboot-darwin-arm64"
    sha256 "a216d37294c9beec0a80d3be36c97243d5f7bff554dca50efe5de4c1d024a721"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.62.0/openboot-darwin-amd64"
    sha256 "70d9c76f60381671f627071c2440bca06e8f8eb593f7b208d1c4ab009b09b60c"
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
