class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "1.0.3"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.3/openboot-darwin-arm64"
    sha256 "b29c3e064ba66d4b2db0bbb34d3e714c1f132eafb58d407a91604a6935c9f185"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.3/openboot-darwin-amd64"
    sha256 "508269aefb9b20165282c5cee45bb6ec9aca7e03c905e322d365b049dd152b14"
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
