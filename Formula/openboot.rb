class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "1.0.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.1/openboot-darwin-arm64"
    sha256 "d02a9498d8a9707baee2b133ea2d6f458ce55ea0e27fe377c3215f412f34f064"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.1/openboot-darwin-amd64"
    sha256 "77cda982cb7ff0aaa3cd591b7a1eac65bb0d6a295d83685a535f85355e727b90"
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
