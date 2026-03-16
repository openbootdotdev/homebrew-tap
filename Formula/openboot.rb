class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.38.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.38.1/openboot-darwin-arm64"
    sha256 "ec233eac046fe5cf81763fe53e49c2da7ce37880a262420a4012ed9f3168a6a9"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.38.1/openboot-darwin-amd64"
    sha256 "1e2730ddc5b30901df89f6f16b7827142461be924402070e0391172bc95f3cff"
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
