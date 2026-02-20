class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.30.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.30.0/openboot-darwin-arm64"
    sha256 "c34cf3f3dad958fd41d396c8ed2b96e48d236165e5902239fabdbdc9a8d7c086"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.30.0/openboot-darwin-amd64"
    sha256 "1b3d8cf7a776dca7625d19ab86ff8dbc038c99fc86884ea9efdc1f7634938db5"
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
