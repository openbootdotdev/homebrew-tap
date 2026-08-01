class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.66.6"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.66.6/openboot-darwin-arm64"
    sha256 "270454f2d93bfe239828aee814ca565eb7a1c426dfdd18b9be1df40499e77bc2"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.66.6/openboot-darwin-amd64"
    sha256 "c5b1ce54edf7c1fe71ace1e2c7872096a4c1217c17f45f4f0704a0cdf5653640"
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
