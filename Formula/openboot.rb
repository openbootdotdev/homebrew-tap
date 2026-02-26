class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.32.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.32.0/openboot-darwin-arm64"
    sha256 "e77d0f8c9f27441c6fa83481138a5b38d38ba331d7e66866b7ccf84d4ac9e604"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.32.0/openboot-darwin-amd64"
    sha256 "c01929d0c9a1b46c294d3b110d8e053b63731417ac45f9b8089118221bb8d76b"
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
