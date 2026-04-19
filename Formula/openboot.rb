class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.55.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.0/openboot-darwin-arm64"
    sha256 "1a211fe902571752cd4b5752233ec97452aa8bf36d649f0adc3ceb11c4794134"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.0/openboot-darwin-amd64"
    sha256 "5df01088f43c4ecdac407a57bd48e8f96e31c20277b030acfb5606ab08bae541"
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
