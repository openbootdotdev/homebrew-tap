class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.30.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.30.1/openboot-darwin-arm64"
    sha256 "ab47133a70c65bc027e5d0b211a883e6b3913a0b9ee4849c8c5a3f9bc640d635"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.30.1/openboot-darwin-amd64"
    sha256 "140d0166b4adb0e631e88bce5ad5d6fe3d7ef6beb585b1156e2aae2ceb29db68"
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
