class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.55.9"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.9/openboot-darwin-arm64"
    sha256 "89da3ebe3111696400eb0ced9b7b2ce89317d01243f1b2469c35dce692de5813"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.9/openboot-darwin-amd64"
    sha256 "a26d9f8c87d6914d80d8d26485d5c5e86efa4cf7dae69c237628214092351f01"
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
