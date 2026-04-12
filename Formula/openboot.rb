class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.54.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.54.1/openboot-darwin-arm64"
    sha256 "b79d32f9f329e7b5402b4953fd58a1fead412d7cb25ae18824371751e28c840c"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.54.1/openboot-darwin-amd64"
    sha256 "b0541747a052848394b806bf65184b0cae8c6660cc8d93b70b5c0b82210c42c9"
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
