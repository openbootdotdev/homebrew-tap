class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.29.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.29.1/openboot-darwin-arm64"
    sha256 "228333ae50f49209940a16d9329a7a71f20c13810db06c207e039c07de287040"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.29.1/openboot-darwin-amd64"
    sha256 "5ba2d864240dba4bad25d3e25fe9117f863a067efc8f97f86d8442a8f97384b0"
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
