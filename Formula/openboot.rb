class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.60.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.60.1/openboot-darwin-arm64"
    sha256 "f5fa14078f8e45ba5bc0eb263d015b22e403f4a25b000b5651cf6abea55954ef"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.60.1/openboot-darwin-amd64"
    sha256 "434a0c45dcfa7fa5fc806c2d6f304b5d66cbe83d269793433d543a28f9bc4cd1"
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
