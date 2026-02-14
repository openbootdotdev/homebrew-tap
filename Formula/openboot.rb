class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.27.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.27.1/openboot-darwin-arm64"
    sha256 "8e78b7b0eb8e5f55dcc23e62fae672c79ee6b531257e4dfc9c730c48a1161bec"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.27.1/openboot-darwin-amd64"
    sha256 "a1b66ce59e870b0b8dcf7b7d1ff178f45ef3050df1af82dae79523065f976053"
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
