class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.35.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.35.0/openboot-darwin-arm64"
    sha256 "b2ca888137a10fd22caaaac74a8c3f80baf8dec7a0a0696cd81494297c0bd10a"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.35.0/openboot-darwin-amd64"
    sha256 "3eaf2bb0e268aa476cc2db086ddecf6f233b62213644ad56b997b7be4f3a7db6"
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
