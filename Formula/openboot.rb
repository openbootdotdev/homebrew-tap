class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "1.0.2"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.2/openboot-darwin-arm64"
    sha256 "7eb5f889ea4d85515373a341d90a99eb75e3716d3c5421fde6f6493e5c587f70"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.2/openboot-darwin-amd64"
    sha256 "a1bf6020807662794941fe63407fff7b93e93e07a5704080194433f0ad84f997"
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
