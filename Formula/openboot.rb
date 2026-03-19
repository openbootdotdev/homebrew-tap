class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.1/openboot-darwin-arm64"
    sha256 "690d87e1d6b5148db26191660713e1321c9c712de491dfbc49202c6da39138e4"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.1/openboot-darwin-amd64"
    sha256 "88d13f2778834c2d23efae346e33327583f385e44638ccce94e54432b414e900"
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
