class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.31.2"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.31.2/openboot-darwin-arm64"
    sha256 "8bf5b8b32f4328b641b80bba5bc1f4f18d2fbf022dc6a465c81f029d0075f34c"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.31.2/openboot-darwin-amd64"
    sha256 "6b4b6e9e1304ac0d54f6deb4ae20d84af2b0d56a1e6db22de957d8c5127568d3"
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
