class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.30.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.30.0/openboot-darwin-arm64"
    sha256 "017341f909b5401d15f3089e5bde39ffaa76b7794ce0cbe22b8dcc09fc3e4c42"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.30.0/openboot-darwin-amd64"
    sha256 "087b0078cd5bc4140cc1e31b0e19d4d9819e8780a190377c1cb3b3c34530d85f"
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
