class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.2"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.2/openboot-darwin-arm64"
    sha256 "63719ffdf129a0ad13e1ac200e77ca54946d1dbe372804ad2b2edcdb489662a8"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.2/openboot-darwin-amd64"
    sha256 "0f95e5cbaa8d3ec1b9e2a180285a17451d8d1e5a0043cd7b761411b8559ca7fd"
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
