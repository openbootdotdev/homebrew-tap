class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.40.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.40.0/openboot-darwin-arm64"
    sha256 "039210b72ed36846123acfde297dc6ece3819cb6091d19846fe31ff214429d0a"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.40.0/openboot-darwin-amd64"
    sha256 "6f8856d8432fb2f61b334ecd3ba0a743c7716bb5f7f1203c190fcb58d65d20b6"
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
