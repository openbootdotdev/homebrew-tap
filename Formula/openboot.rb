class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.58.13"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.13/openboot-darwin-arm64"
    sha256 "775771c84670c1ad0afe3297e705495b4c99242afda77b41c179e966af7f6f8d"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.58.13/openboot-darwin-amd64"
    sha256 "b330805072154b0b85a83587d934f230d49a49a5dddc18e2ba9963e6fbcb0f64"
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
