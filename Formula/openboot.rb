class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.9/openboot-darwin-arm64"
    sha256 "2b30fd7551bd3179d2497421a0373f42ecff89066b9fcb639ada8428e0d782fd"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.9/openboot-darwin-amd64"
    sha256 "32df1a6acf71634d943fc697c00a91f8730afb35e2945ad982f7a9dbb1577b6f"
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
