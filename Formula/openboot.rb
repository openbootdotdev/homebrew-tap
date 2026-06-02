class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.60.2"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.60.2/openboot-darwin-arm64"
    sha256 "4c2e132953e76346c20d60e2cc92a5aee3730256bfbd2b6945964a238a70d658"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.60.2/openboot-darwin-amd64"
    sha256 "27fc2dc981ddb172754996a4e825e335470a18ff7821bb1a1e4e08e76e27d25b"
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
