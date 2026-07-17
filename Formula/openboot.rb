class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.66.3"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.66.3/openboot-darwin-arm64"
    sha256 "424dc37516f2af726fcf8c3021fdf45e0fb206c75db2e677d9cfd8c53d107ec2"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.66.3/openboot-darwin-amd64"
    sha256 "0d520ba8d40d7d246de1bc561d2b19c8c66bb7664c887c2bd949b76b9d99b5b9"
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
