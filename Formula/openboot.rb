class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.10"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.10/openboot-darwin-arm64"
    sha256 "c33a4b944845518752a01f21208ead9be880dfe19651fc465427bbb8c7af4fbe"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.10/openboot-darwin-amd64"
    sha256 "17e3a66956aab1a8d467204a9be6e1d5b1f3fcb021bec6c50f3f20cc27771990"
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
