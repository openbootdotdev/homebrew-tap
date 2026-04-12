class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.54.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.54.0/openboot-darwin-arm64"
    sha256 "43cfc8781935f856182eb13ed90f97bd4605dd7825c1afba89ade435d8cf7e87"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.54.0/openboot-darwin-amd64"
    sha256 "2df177663b176791e33c79868b187d77af49f66d13a04d0f026a309687aec3ac"
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
