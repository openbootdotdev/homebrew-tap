class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.6/openboot-darwin-arm64"
    sha256 "c658edef66012cdd76c838cdcfb004644e2b4abffb4d5c5e175ad9d6b77060d2"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.6/openboot-darwin-amd64"
    sha256 "ec1871efc80a6763afe612e4e17dc5bed5ae217cf9879221f8b48d8288c78265"
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
