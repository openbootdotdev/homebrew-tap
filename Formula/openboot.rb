class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.9"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.9/openboot-darwin-arm64"
    sha256 "bd45645954670ad1baed9fe367711fe2ce218dcde15fafde824e50efdb6e9ffc"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.9/openboot-darwin-amd64"
    sha256 "b6bb0f20ed11e7d43b890c8c234410bcb771f3af7b95f85908fc234e95b7f2b8"
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
