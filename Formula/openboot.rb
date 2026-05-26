class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.58.14"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.14/openboot-darwin-arm64"
    sha256 "a6befd321707dbdae23e1ad3f4e4cb9722b8c6fa0ad5b2cef6ec58b66f947e4c"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.14/openboot-darwin-amd64"
    sha256 "5ed5b1e48a2a9d1ad54835bc46764f65fa252f4207bf2eec60c48b9ecb527cb7"
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
