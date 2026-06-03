class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.61.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.61.1/openboot-darwin-arm64"
    sha256 "528adaf074056d56e426dac00fd1a29f0e505898013a26104cf193e71152f4ec"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.61.1/openboot-darwin-amd64"
    sha256 "61acf59d5ffc536bd0eaa9dff36ded8c6c5e4bc241c7a51676951acf79b19318"
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
