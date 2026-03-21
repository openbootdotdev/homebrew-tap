class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.13"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.13/openboot-darwin-arm64"
    sha256 "773f022900d19ceb6ef017c7a0eb3ef1247599984b2044a0808d96acac130d0a"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.13/openboot-darwin-amd64"
    sha256 "24936a62b1891a3785d5679e93f13857517976b0e40ca3a81539d471298c5491"
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
