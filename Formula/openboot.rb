class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.58.11"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.11/openboot-darwin-arm64"
    sha256 "feac705bfb0b9e7fa9d7e31c8265ce152560dc0dc84b85e4d5af2faf982868bb"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.11/openboot-darwin-amd64"
    sha256 "c49769d70a5b0ba0fb927a6346631ffe7346d695d14c9e03d077a14ac9f67b96"
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
