class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.7/openboot-darwin-arm64"
    sha256 "8410e7dc75d85f732bb65a9c2f0e440afb9646db6624a1f1b1927e2ebe4f5e76"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v1.0.7/openboot-darwin-amd64"
    sha256 "9177e451281e71c8eb86c4f0ef7ae219595edb665afa9fb7de2c02954566a4c3"
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
