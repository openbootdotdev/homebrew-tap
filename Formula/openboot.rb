class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.59.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.59.0/openboot-darwin-arm64"
    sha256 "ea430c9338cc4da550f24047546fe69b626dc4783d2b2a867a6247d02534fd6b"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.59.0/openboot-darwin-amd64"
    sha256 "9e0e5d42c6b9d56be74ea99f5cdf71c2f3c907279d94f138509c57f3b917a424"
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
