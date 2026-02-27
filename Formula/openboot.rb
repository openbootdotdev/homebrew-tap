class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.33.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.33.1/openboot-darwin-arm64"
    sha256 "aa0954c535852faba89f8e039768cc465fd219042d135c0d7535a04643fb9187"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.33.1/openboot-darwin-amd64"
    sha256 "010f76ad85b287e56d4094a6cfd8fc7d1384eb03339adf0f080dddc317f616eb"
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
