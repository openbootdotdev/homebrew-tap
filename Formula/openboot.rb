class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.27.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.27.0/openboot-darwin-arm64"
    sha256 "b61dee94ad2147d1b83e97565d4d5f2da6a4eac57e35536fd86ebbd8b7515ce9"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.27.0/openboot-darwin-amd64"
    sha256 "81e851edda168a5231df97910d6005fffe41f05fe7f067bf391f7b524203e1a5"
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
