class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.34.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.34.0/openboot-darwin-arm64"
    sha256 "8b354c37bffe0f609ca05665834550332f30a51e1825f94146ed48d626e1b577"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.34.0/openboot-darwin-amd64"
    sha256 "a8a61624c3c315ba0ce3068d1b644fce815439b21222013688a3c0ae4fd9178b"
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
