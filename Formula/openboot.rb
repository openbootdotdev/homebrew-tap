class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.41.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.41.0/openboot-darwin-arm64"
    sha256 "61bac83663e51b03d12f29b53bd581af7186400d8921a11646ee47c91d352d8b"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.41.0/openboot-darwin-amd64"
    sha256 "c2c48ce77f321eaac9ad51bacb880dcb8edfbfc1320403303877ce0dfce952ee"
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
