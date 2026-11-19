class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.10/openboot-darwin-arm64"
    sha256 "21bba28efc3267cf5de29ae582c690c9f4ca323ea4a35f5a7ea7a54d7509a9fa"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.10/openboot-darwin-amd64"
    sha256 "b5a020df908f620428945eec5f94ac275187f90cc16cd834e05ab51afbbd5465"
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
