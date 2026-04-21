class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.55.2"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.2/openboot-darwin-arm64"
    sha256 "e8128b39377382ba8c52ee259c374299f0776c85034f7f6a139dba0403b1cbff"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.2/openboot-darwin-amd64"
    sha256 "dd3123a6bd5f2dfb723fcd6500a4eda3eac2a167b885bba754ed45b665a9388c"
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
